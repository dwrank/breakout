defmodule BreakoutWeb.Live.Control do
  @moduledoc """
  Game control functions
  """

  use Phoenix.LiveView
  use BreakoutWeb.Live.Config

  # from input events
  #
  @spec move_paddle(paddle(), :left | :right) :: paddle()
  def move_paddle(paddle, direction) do
    if paddle.direction == direction do
      paddle
    else
      %{paddle | direction: direction}
    end
  end

  @spec stop_paddle(paddle(), :left | :right) :: paddle()
  def stop_paddle(paddle, direction) do
    if paddle.direction == direction do
      %{paddle | direction: :stationary}
    else
      paddle
    end
  end

  @spec cursor_move_paddle(paddle(), cursor()) :: paddle()
  def cursor_move_paddle(paddle, cursor) do
    cond do
      cursor.x < paddle.left + paddle.half_width ||
      cursor.x > paddle.left + paddle.half_width ->
        %{paddle | direction: :to_cursor}
      true -> paddle
    end
  end

  # from game loop, advance paddle
  #
  @spec move_paddle_left(paddle(), number()) :: paddle()
  def move_paddle_left(paddle, unit) do
    new_left = max(unit, paddle.left - paddle.speed)
    %{paddle | left: new_left, right: paddle.right - (paddle.left - new_left)}
  end

  @spec move_paddle_right(paddle(), number()) :: paddle()
  def move_paddle_right(paddle, unit) do
    new_left = min(paddle.left + paddle.speed, unit * (@board_cols - paddle.length - 1))
    %{paddle | left: new_left, right: paddle.right + (new_left - paddle.left)}
  end

  @spec move_paddle_to_cursor(paddle(), cursor(), number()) :: paddle()
  def move_paddle_to_cursor(paddle, cursor, unit) do
    new_left = min(cursor.x - paddle.half_width, unit * (@board_cols - paddle.length - 1))
    new_left = max(unit, new_left)
    %{paddle | direction: :stationary, left: new_left, right: paddle.right + (new_left - paddle.left)}
  end
end

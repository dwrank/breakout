defmodule BreakoutWeb.GameController do
  use BreakoutWeb, :controller

  alias BreakoutWeb.Live.Game
  alias Phoenix.LiveView

  def index(conn, _) do
    LiveView.Controller.live_render(conn, Game)
  end
end

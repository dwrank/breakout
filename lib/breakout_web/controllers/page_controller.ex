defmodule BreakoutWeb.PageController do
  use BreakoutWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

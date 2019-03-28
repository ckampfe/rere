defmodule RereWeb.PageController do
  use RereWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

defmodule IotWeb.PageController do
  use IotWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

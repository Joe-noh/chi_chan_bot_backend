defmodule ChiChan.PageController do
  use ChiChan.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end
end

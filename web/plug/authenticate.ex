defmodule ChiChan.Authenticate do
  import Plug.Conn

  def init(_) do
    Application.get_env(:chi_chan, ChiChan.Authenticate)
    |> Keyword.get(:password)
  end

  def call(conn, expected) do
    given = Map.get(conn.params, "password")
    if expected == given do
      conn
    else
      halt conn
    end
  end
end

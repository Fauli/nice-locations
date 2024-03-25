defmodule NiceLocationsWeb.HelloController do
  use NiceLocationsWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end
end

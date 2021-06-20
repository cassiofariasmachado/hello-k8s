defmodule HelloK8sWeb.PageController do
  use HelloK8sWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

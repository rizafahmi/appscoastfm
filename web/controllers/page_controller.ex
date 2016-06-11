defmodule AppscoastFm.PageController do
  use AppscoastFm.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

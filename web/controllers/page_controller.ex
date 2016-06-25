defmodule AppscoastFm.PageController do
  use AppscoastFm.Web, :controller

  alias AppscoastFm.Episode
  alias AppscoastFm.Repo

  def index(conn, _params) do
    episodes = Repo.all(Episode)
    render(conn, "index.html", episodes: episodes)
  end
  defp podcast_episodes(podcast) do
    assoc(podcast, :episodes)
  end
end

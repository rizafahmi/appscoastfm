defmodule AppscoastFm.EpisodeController do
  use AppscoastFm.Web, :controller

  alias AppscoastFm.Episode

  plug :scrub_params, "episode" when action in [:create, :update]

  def index(conn, _params, podcast) do
    episodes = Repo.all(podcast_episodes(podcast))
    render(conn, "index.html", episodes: episodes)
  end

  def new(conn, _params, podcast) do
    changeset =
      podcast
      |> build_assoc(:episodes)
      |> Episode.changeset()
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"episode" => episode_params}, podcast) do
    changeset = 
      podcast
      |> build_assoc(:episodes)
      |> Episode.changeset()

    case Repo.insert(changeset) do
      {:ok, _episode} ->
        conn
        |> put_flash(:info, "Episode created successfully.")
        |> redirect(to: episode_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}, podcast) do
    episode = Repo.get!(podcast_episodes(podcast), id)
    render(conn, "show.html", episode: episode)
  end

  def edit(conn, %{"id" => id}, podcast) do
    episode = Repo.get!(podcast_episodes(podcast), id)
    changeset = Episode.changeset(episode)
    render(conn, "edit.html", episode: episode, changeset: changeset)
  end

  def update(conn, %{"id" => id, "episode" => episode_params}, podcast) do
    episode = Repo.get!(podcast_episodes(podcast), id)
    changeset = Episode.changeset(episode, episode_params)

    case Repo.update(changeset) do
      {:ok, episode} ->
        conn
        |> put_flash(:info, "Episode updated successfully.")
        |> redirect(to: episode_path(conn, :show, episode))
      {:error, changeset} ->
        render(conn, "edit.html", episode: episode, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}, podcast) do
    episode = Repo.get!(podcast_episodes(podcast), id)

    Repo.delete!(episode)

    conn
    |> put_flash(:info, "Episode deleted successfully.")
    |> redirect(to: episode_path(conn, :index))
  end

  defp podcast_episodes(podcast) do
    assoc(podcast, :episodes)
  end

  def action(conn, _) do
    apply(__MODULE__, action_name(conn), [conn, conn.params, conn.assigns.current_user])
  end

end

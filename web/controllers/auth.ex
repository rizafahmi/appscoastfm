require IEx
defmodule AppscoastFm.Auth do
  import Plug.Conn
  import Comeonin.Bcrypt, only: [checkpw: 2, dummy_checkpw: 0]

  alias AppscoastFm.Router.Helpers

  def init(opts) do
    Keyword.fetch!(opts, :repo)
  end

  def call(conn, repo) do
    user_id = get_session(conn, :user_id)
    user = user_id && repo.get(AppscoastFm.Podcast, user_id)
    assign(conn, :current_user, user)
  end

  def login(conn, user) do
    conn
    |> assign(:current_user, user)
    |> put_session(:user_id, user.id)
    |> configure_session(renew: true)
  end

  def login_by_email_and_pass(conn, email, given_pass, opts) do
    repo = Keyword.fetch!(opts, :repo)
    podcast = repo.get_by(AppscoastFm.Podcast, email: email)

    cond do
      podcast && checkpw(given_pass, podcast.password_hash) ->
        {:ok, login(conn, podcast)}
      podcast ->
        {:error, :unathorized, conn}
      true ->
        dummy_checkpw()
        {:error, :not_found, conn}
    end
  end

  def logout(conn) do
    configure_session(conn, drop: true)
  end

  def authenticate_user(conn, _opts) do
    if conn.assigns.current_user do
      conn
    else
      conn
      |> Phoenix.Controller.put_flash(:error, "You must be logged in to access that page")
      |> Phoenix.Controller.redirect(to: Helpers.page_path(conn, :index))
      |> halt()
    end
  end

end

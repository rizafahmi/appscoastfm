defmodule AppscoastFm.SessionController do
  use AppscoastFm.Web, :controller
  
  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, %{"session" => %{"email" => email, "password" => password}}) do
    case AppscoastFm.Auth.login_by_email_and_pass(conn, email, password, repo: Repo) do
      {:ok, conn} ->
        conn
        |> put_flash(:info, "Welcome back!")
        |> redirect(to: podcast_path(conn, :index))
      {:error, _reason, conn} ->
        conn
        |> put_flash(:error, "Invalid email or password")
        |> render("new.html")
    end
  end

  def delete(conn, _) do
    conn
    |> AppscoastFm.Auth.logout()
    |> put_flash(:info, "Come back soon!")
    |> redirect(to: page_path(conn, :index))
  end
end

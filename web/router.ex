defmodule AppscoastFm.Router do
  use AppscoastFm.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug AppscoastFm.Auth, repo: AppscoastFm.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AppscoastFm do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/sessions", SessionController, only: [:new, :create, :delete]
  end

  scope "/", AppscoastFm do
    pipe_through [:browser, :authenticate_user]
    resources "/podcasts", PodcastController
    resources "/episodes", EpisodeController
  end

  # Other scopes may use custom stacks.
  # scope "/api", AppscoastFm do
  #   pipe_through :api
  # end
end

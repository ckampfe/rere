defmodule RereWeb.Router do
  use RereWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :put_layout, {RereWeb.LayoutView, :app}
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", RereWeb do
    pipe_through :browser

    live "/rere", RereLive

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", RereWeb do
  #   pipe_through :api
  # end
end

defmodule TimeManagerWeb.Router do
  use TimeManagerWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", TimeManagerWeb do
    pipe_through :api

    resources "/roles", RoleController
    resources "/users", UserController
    resources "/teams", TeamController
    resources "/users_teams", UserTeamController
    resources "/working_times", WorkingTimeController

    get "/working_times_by_user/:id", WorkingTimeController, :getAllByUserId
  end

  scope "/", TimeManagerWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", TimeManagerWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: TimeManagerWeb.Telemetry
    end
  end
end

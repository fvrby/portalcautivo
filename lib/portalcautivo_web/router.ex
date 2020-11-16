defmodule PortalcautivoWeb.Router do
  use PortalcautivoWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug :fetch_session
  # plug :fetch_flash                # no nos sirve
  # plug :protect_from_forgery       # no nos sirve
  # plug :put_secure_browser_headers # no nos sirve
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PortalcautivoWeb do
    pipe_through :api

    get "/", PageController, :index

    resources "/clients", ClientController, except: [:new, :edit, :create] do
      get "/clients", ClientController, :show
      post "/clients", ClientController, :create
      patch "/clients", ClientController, :update
      delete "/clients", ClientController, :delete
    end

    resources "/captives", CaptiveController, except: [:new, :edit]

    resources "/projects", ProjectController, except: [:new, :edit]

    resources "/nas", NasController, except: [:new, :edit]

    resources "/nascamp", NascampController, except: [:new, :edit]

    resources "/campaign", CampaignController, except: [:new, :edit]

    resources "/components", ComponentsController, except: [:new, :edit]

  end

  # Other scopes may use custom stacks.
  # scope "/api", PortalcautivoWeb do
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
      pipe_through [:fetch_session, :protect_from_forgery] # Cuidar esto
      live_dashboard "/dashboard", metrics: PortalcautivoWeb.Telemetry
    end
  end
end

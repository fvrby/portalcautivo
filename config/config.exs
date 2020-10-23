# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :portalcautivo,
  ecto_repos: [Portalcautivo.Repo]

# Configures the endpoint
config :portalcautivo, PortalcautivoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "hKAgO/0L7HowDKJFICzS+fYjqf1CV8isu+oTjfiEybXrrT2cSxFsXGr33oJl8NB1",
  render_errors: [view: PortalcautivoWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Portalcautivo.PubSub,
  live_view: [signing_salt: "2gCe3JDJ"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

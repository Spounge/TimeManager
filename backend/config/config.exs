# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :backend,
  namespace: TimeManagerApi,
  ecto_repos: [TimeManagerApi.Repo]

# Configures the endpoint
config :backend, TimeManagerApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "3bNxJ7Oj6g2gAFpJL0PgR3CA4j1ElKdJvHebuxkqyOlsJp9xwwSS7XoX8z2eaXvk",
  render_errors: [view: TimeManagerApiWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: TimeManagerApi.PubSub,
  live_view: [signing_salt: "/g95ID6v"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

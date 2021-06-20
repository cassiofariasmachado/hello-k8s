# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :hello_k8s,
  ecto_repos: [HelloK8s.Repo]

config :hello_k8s, HelloK8s.Repo,
  adapter: Ecto.Adapters.Postgres,
  pool_size: 10

# Configures the endpoint
config :hello_k8s, HelloK8sWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "mWugmCZ5BvRNCW89g4cxwq/8roTQQIi0GNZDKq1Fbe8eHcew+L36ig50MOjg4HSA",
  render_errors: [view: HelloK8sWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: HelloK8s.PubSub,
  live_view: [signing_salt: "TS4QuhRz"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

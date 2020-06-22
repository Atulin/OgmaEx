# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :ogmaEx,
  ecto_repos: [OgmaEx.Repo]

# Configures the endpoint
config :ogmaEx, OgmaExWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "H1dxttVc2fz/YbRO/dwIr1WSmhBn9nU1lK02oDsl+rLBZzOpIhxigKuPhuDa4PHf",
  render_errors: [view: OgmaExWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: OgmaEx.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

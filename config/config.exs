# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :iot,
  ecto_repos: [Iot.Repo]

# Configures the endpoint
config :iot, IotWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "o/goWBm/irypnbe+OVQd1TeHAOFktkhhQ7XcK4IRs7IR6jt5IW2jjBW8EORVWOb8",
  render_errors: [view: IotWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Iot.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

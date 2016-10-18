# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :todos,
  ecto_repos: [Todos.Repo]

# Configures the endpoint
config :todos, Todos.Endpoint,
  url: [host: "localhost"],
  secret_key_base: System.get_env("APP_SECRET") || "fa9dh8LSbRjl0Sb8hZFxSFgNhXPUNvXjfUmDrOXfHoVXdm48SmUhU9pcTGjrcbxk",
  render_errors: [view: Todos.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Todos.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configure your database
config :todos, Todos.Repo,
  adapter: Ecto.Adapters.MySQL,
  username: System.get_env("DB_USER") || "phoenix",
  password: System.get_env("DB_PASSWORD") || "",
  database: System.get_env("DB_DATABASE") || "todos_test",
  hostname: System.get_env("DB_HOST") || "127.0.0.1",
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "8")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

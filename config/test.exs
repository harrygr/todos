use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :todos, Todos.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :todos, Todos.Repo,
  adapter: Ecto.Adapters.MySQL,
  username: "phoenix",
  password: "",
  database: "todos_test",
  hostname: "127.0.0.1",
  pool: Ecto.Adapters.SQL.Sandbox

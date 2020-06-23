use Mix.Config

# Configure your database
config :ogmaEx, OgmaEx.Repo,
  username: System.get_env("DBUSER"),
  password: System.get_env("DBPASS"),
  database: System.get_env("DBNAME"),
  hostname: System.get_env("DBHOST"),
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :ogmaEx, OgmaExWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

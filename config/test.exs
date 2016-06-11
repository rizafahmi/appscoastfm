use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :appscoast_fm, AppscoastFm.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :appscoast_fm, AppscoastFm.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "appscoast_fm_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

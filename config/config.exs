# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :appscoast_fm, AppscoastFm.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "n3jKu9DZy70AZ9e0De4Wfa+KVC1mSA/Z69RJpLALuaBq2aIQHcrGiiXindLn321H",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: AppscoastFm.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false

config :arc,
  bucket: "appscoastfm",
  virtual_host: true,
  version_timeout: 100_000_000_000 #milliseconds

config :ex_aws, #:httpoison_opts,
  # access_key_id: [{:system, "AWS_ACCESS_KEY_ID"}, :instance_role],
  # secret_access_key: [{:system, "AWS_SECRET_ACCESS_KEY"}, :instance_role]
  access_key_id: "AKIAJ363KS24V5ANFFPA",
  secret_access_key: "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",
  region: "ap-southeast-1",
  # host: "kilatstorage.com",
  host: "s3-ap-southeast-1.amazonaws.com",
  recv_timeout: 60_000_000,
  hackney: [recv_timeout: 60_000_000, pool: false],
  s3: [
    bucket: "appscoastfm",
    schema: "https://",
    host: "s3-ap-southeast-1.amazonaws.com",
    region: "ap-southeast-1"
  ]

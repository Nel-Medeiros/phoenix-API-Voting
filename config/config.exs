# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :voting,
  ecto_repos: [Voting.Repo]

# Configures the endpoint
config :voting, VotingWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "yc/kJ7NV5DeCpLqK3cSzRMhHKXpG/SdarOmuQCF/3eHFpGiKdkwiu5v38/npvYpM",
  render_errors: [view: VotingWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Voting.PubSub,
  live_view: [signing_salt: "zZFrVt0U"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :bankparse,
  ecto_repos: [Bankparse.Repo]

# Configures the endpoint
config :bankparse, BankparseWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "gDglcc468pbt3XlbbP9Kg7QkrbhOxx6Lr1C5Rhv9GZzrZhjbWlpptNmeZYlMCcTZ",
  render_errors: [view: BankparseWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Bankparse.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :rere, RereWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "yYkSRXqW3QEjUI3Jj88YEb8a7SPbmf6c7lz8Xh14SbwhoVMqNUnFHNHD+1SFbsWd",
  render_errors: [view: RereWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Rere.PubSub, adapter: Phoenix.PubSub.PG2]

config :rere, RereWeb.Endpoint,
   live_view: [
     signing_salt: "MmHp8UjFQakGzFiNLzpAtGfV5fX3kRXC"
   ]

config :phoenix,
  template_engines: [leex: Phoenix.LiveView.Engine]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :breakout, BreakoutWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "dtWmzV0O+XcI1zVJGZgtABRFsXl5PC3RTXkg3t69Wq8y32J3vV2xgp3RobhOA0kN",
  server: false

# In test we don't send emails.
config :breakout, Breakout.Mailer,
  adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

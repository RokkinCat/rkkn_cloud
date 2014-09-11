# This file is responsible for configuring your application
use Mix.Config

# Note this file is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project.

config :phoenix, RkknCloud.Router,
  port: System.get_env("PORT"),
  ssl: false,
  static_assets: true,
  cookies: true,
  session_key: "_rkkn_cloud_key",
  session_secret: "@MM0F^=PLVV)J=&*(B!&*EMK#!1(EQ=82YP*=ZXP30RWKHPVJ+$MJL*!TT4O#(JN47(UD3^1+YIX4!_",
  catch_errors: true,
  debug_errors: false,
  error_controller: RkknCloud.PageController

config :phoenix, :code_reloader,
  enabled: false

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. Note, this must remain at the bottom of
# this file to properly merge your previous config entries.
import_config "#{Mix.env}.exs"

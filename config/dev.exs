use Mix.Config

config :phoenix, RkknCloud.Router,
  port: System.get_env("PORT") || 4000,
  ssl: false,
  host: "localhost",
  cookies: true,
  session_key: "_rkkn_cloud_key",
  session_secret: "@MM0F^=PLVV)J=&*(B!&*EMK#!1(EQ=82YP*=ZXP30RWKHPVJ+$MJL*!TT4O#(JN47(UD3^1+YIX4!_",
  debug_errors: true

config :phoenix, :code_reloader,
  enabled: true

config :logger, :console,
  level: :debug



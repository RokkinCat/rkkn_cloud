use Mix.Config

# NOTE: To get SSL working, you will need to set:
#
#     ssl: true,
#     keyfile: System.get_env("SOME_APP_SSL_KEY_PATH"),
#     certfile: System.get_env("SOME_APP_SSL_CERT_PATH"),
#
# Where those two env variables point to a file on disk
# for the key and cert

config :phoenix, RkknCloud.Router,
  port: System.get_env("PORT"),
  ssl: false,
  host: "example.com",
  cookies: true,
  session_key: "_rkkn_cloud_key",
  session_secret: "@MM0F^=PLVV)J=&*(B!&*EMK#!1(EQ=82YP*=ZXP30RWKHPVJ+$MJL*!TT4O#(JN47(UD3^1+YIX4!_"

config :logger, :console,
  level: :info,
  metadata: [:request_id]


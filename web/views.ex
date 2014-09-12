defmodule RkknCloud.Views do
  import Plug.Conn, only: [get_req_header:  2,
                           put_resp_header: 3,
                           send_resp:       3,
                           halt:            1]
  defmacro __using__(_options) do
    quote do
      use Phoenix.View
      import unquote(__MODULE__)

      # This block is expanded within all views for aliases, imports, etc
      import RkknCloud.I18n
      import RkknCloud.Router.Helpers
    end
  end

  # Functions defined here are available to all other views/templates
  def datetime_string(date_time) do
    date_time.to_erl
      |> Date.from
      |> DateFormat.format!("{RFC1123}")
      |> Poison.Encoder.BitString.encode
  end

  def authenticate(conn, _options) do
    conn 
      |> get_req_header("authorization")
      |> parse_auth
      |> check_credentials(conn)
  end

  defp parse_auth(["Basic " <> encoded_creds | _]) do
    {:ok, decoded} = Base.decode64(encoded_creds)
    decoded
  end
  defp parse_auth([]), do: nil

  defp check_creds(api_key <> ":", conn) do
    case APIKey.fetch(api_key) do
      nil -> respond_with_login(conn)
      _ -> conn
    end
  end
  defp check_creds(_, conn) do: respond_with_login(conn) 

  defp respond_with_login(conn) do
    conn
    |> put_resp_header("Www-Authenticate", "Basic realm=\"Private Area\"")
    |> send_resp(401, "")
    |> halt!
  end
end



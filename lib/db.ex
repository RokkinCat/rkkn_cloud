defmodule DB do
  use Ecto.Repo, adapter: Ecto.Adapters.Postgres, env: Mix.env
  require Logger

  @doc "Adapter configuration"
  def conf(env), do: parse_url url(env)

  defp url(:dev) do
    "ecto://localhost/rkkn_cloud_db_dev"
  end

  defp url(:test) do
    "ecto://localhost/rkkn_cloud_db_test?size=1&max_overflow=0"
  end

  defp url(:prod) do
    url = System.get_env("DATABASE_URL")

    if is_nil(url) do
      raise "DATABASE_URL must be set"
    end

    Regex.replace(~r/postgres:\/\//, url, "ecto://", global: false)
  end

  @doc "The priv directory to load migrations and metadata."
  def priv do
    app_dir(:rkkn_cloud, "priv/db")
  end

  def log({:query, sql}, fun) do
    {time, result} = :timer.tc(fun)
    Logger.info("#{time} #{sql}")
    result
  end
end

defimpl Poison.Encoder, for: Ecto.DateTime do
  def encode(date_time, _options) do
    date_time.to_erl
      |> Date.from
      |> DateFormat.format!("{RFC1123}")
      |> Poison.Encoder.BitString.encode
  end
end

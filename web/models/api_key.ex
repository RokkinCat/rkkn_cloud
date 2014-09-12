defmodule APIKey do
  use Ecto.Model
  import Ecto.Query

  schema "api_keys" do
    field :key, :string
    field :created_at, :datetime
    field :email, :string
    has_many :datasets, Dataset
  end

  validate apikey,
    email: has_format(~r/.+\@.+\..+/)

  def fetch(nil), do: nil
  def fetch(""), do: nil
  def fetch(api_key) when is_binary(api_key) do
    query = from w in APIKey,
            where: w.api_key == ^api_key,
            select: w
    DB.one(query)
  end

  def new(email) do
    %APIKey{email: email, 
            key: new_key(), 
            created_at: :calendar.local_time_to_universal_time(:calendar.local_time)
    }
  end

  defp new_key() do
    :crypto.strong_rand_bytes(8)
      |> :crypto.hash(:sha256)
      |> Base.encode64
  end

  defimpl Poison.Encoder, for: APIKey do
    def encode(%{email: email, created_at: created_at, key: key}, _options) do
      Poison.Encoder.BitString.encode(%{email: email, created_at: created_at, key: key})
    end
  end

end



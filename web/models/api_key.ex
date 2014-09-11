defmodule APIKey do
  use Ecto.Model

  schema "api_keys" do
    field :key, :string
    field :created_at, :datetime
    field :email, :string
    has_many :datasets, Dataset
  end
end


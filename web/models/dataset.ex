defmodule Dataset do
  use Ecto.Model

  schema "datasetss" do
    field :name, :string
    field :created_at, :datetime
    field :table_name, :string
    belongs_to :api_keys, APIKey
  end
end

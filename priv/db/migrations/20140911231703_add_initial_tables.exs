defmodule DB.Migrations.AddInitialTables do
  use Ecto.Migration

  def up do
    [
    "CREATE TABLE IF NOT EXISTS api_keys(id serial primary key, key text, created_at timestamp, email text)",
    "CREATE TABLE IF NOT EXISTS datasets(id serial primary key, created_at timestamp, name text, table_name text, api_id references api_keys(id))"
    ]
  end

  def down do
    [
      "DROP TABLE IF EXISTS datasets",
      "DROP TABLE IF EXISTS api_keys"
    ]
  end
end

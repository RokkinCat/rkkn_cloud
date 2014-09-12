defmodule RkknCloud.ApiKeyView do
  use RkknCloud.Views
  alias Poison, as: JSON

  def render("index.json", %{api_key: api_key}) do
    JSON.encode! api_key
  end

  def render("not_found.json", _params) do
    JSON.encode! %{error: "Not found"}
  end

  def render("error.json", %{errors: errors}) do
    JSON.encode! %{errors: errors}
  end
end

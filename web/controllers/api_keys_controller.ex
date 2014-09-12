defmodule RkknCloud.ApiKeysController do
  use Phoenix.Controller

  def show(conn, %{id: key}) do
    case APIKey.fetch(key) do
      nil -> render assign_status(conn, 404), "not_found"
      api_key -> render conn, "index", api_key
    end
  end

  def new(conn, _params) do
    render conn, "new"
  end

  def create(conn, params=%{email: email}) do 
    api_key = APIKey.new(email)

    case APIKey.validate(api_key) do
      [] -> render conn, "index", DB.insert(api_key)
      errors -> render assign_status(conn, 400), "error", errors: errors
    end
  end 

  def destroy(conn, params=%{id: key}) do
    case APIKey.fetch(key) do
      nil -> render conn, "not_found", 404
      api_key -> DB.delete(api_key)
    end
    redirect conn, Router.api_key_route(:new), 303
  end
end

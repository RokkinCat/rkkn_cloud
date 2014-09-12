defmodule RkknCloud.Router do
  use Phoenix.Router

  get "/", RkknCloud.PageController, :index, as: :pages
  resources "/api_key", RkkCloud.ApiKeysController
  resources "/dataset", RkkCloud.DatasetController
end

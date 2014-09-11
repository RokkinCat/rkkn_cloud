defmodule RkknCloud.Router do
  use Phoenix.Router

  get "/", RkknCloud.PageController, :index, as: :pages

end

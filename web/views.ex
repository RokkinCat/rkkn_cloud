defmodule RkknCloud.Views do

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
end



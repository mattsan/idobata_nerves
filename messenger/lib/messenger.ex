defmodule Messenger do
  @moduledoc """
  Documentation for Messenger.
  """

  @hook Application.get_env(:messenger, :idobata_hook)

  def post(message) do
    @hook
    |> ExIdobata.new_hook()
    |> ExIdobata.post(source: message)
  end
end

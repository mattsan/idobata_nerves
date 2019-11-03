defmodule Messenger do
  @moduledoc """
  Documentation for Messenger.
  """

  @room_uuid Application.get_env(:messenger, :idobata_hook)

  def post(message) do
    ExIdobata.Hook.contents(source: message)
    |> ExIdobata.Hook.post(@room_uuid)
  end
end

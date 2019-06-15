defmodule Messenger.Periodical do
  use GenServer

  require Logger

  @name __MODULE__

  def start_link(opts) do
    {name, rest_opts} = Keyword.pop(opts, :name, @name)
    GenServer.start_link(__MODULE__, rest_opts, name: name)
  end

  def init(opts) do
    state = opts |> Map.new() |> Map.put(:interval, 10_000)
    {:ok, ref} = :timer.send_interval(state.interval, :post_message)
    {:ok, Map.put(state, :ref, ref)}
  end

  def handle_info(:post_message, state) do
    message = "Hi"
    Logger.debug("post message: #{message}")
    Messenger.post(message)

    {:noreply, state}
  end

  def handle_info(event, state) do
    Logger.debug("ignored event: #{inspect(event)}")
    {:noreply, state}
  end
end

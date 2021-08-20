defmodule Mutantex.Fib do
  use GenServer

  def init(_args), do: {:ok, %{"0" => 1, "1" => 1}}

  def start_link(state) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def fib(n) do
    GenServer.call(__MODULE__, {:fib, n})
  end

  def handle_call({:fib, n}, _from, state) do
    {:ok, res, state} = get(state, n)

    {:reply, res, state}
  end

  defp get(state, n) do
    res = Map.get(state, to_string(n))

    if is_nil(res) do
      {:ok, fib_a, state} = get(state, n - 1)
      {:ok, fib_b, state} = get(state, n - 2)

      res   = fib_a + fib_b
      state = Map.put(state, to_string(n), res)

      {:ok, res, state}
    else
      {:ok, res, state}
    end
  end
end

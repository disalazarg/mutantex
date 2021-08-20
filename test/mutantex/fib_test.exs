defmodule Mutantex.FibTest do
  use ExUnit.Case

  alias Mutantex.Fib

  describe "Fibonacci module" do
    test "it can give the correct result for n <= 2" do
      assert Fib.fib(1) == 1
    end

    test "it can give the correct result for n > 2" do
      assert Fib.fib(5) == 8
    end
  end
end

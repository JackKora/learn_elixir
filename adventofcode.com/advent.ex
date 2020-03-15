defmodule Advent do
    @moduledoc """
    Exercises for a pretty cool https://adventofcode.com/ Elixir training/tutorial
    """

    def a1() do
        mass = File.read!("input.1") |> String.split("\n", trim: true)
        fuel = Enum.map(mass, &(div(String.to_integer(&1), 3) - 2)) |> Enum.reduce(&+/2)
        IO.puts(fuel)
    end

end

IO.puts Advent.a1

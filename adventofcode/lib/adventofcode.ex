defmodule Adventofcode do
    @moduledoc """
    Exercises for a pretty cool https://adventofcode.com/ Elixir training/tutorial
    """

    def day1_part1() do
        mass = File.read!("lib/input.day1") |> String.split("\n", trim: true)
        Enum.map(mass, &(div(String.to_integer(&1), 3) - 2)) |> Enum.reduce(&+/2)
    end

end

IO.puts Adventofcode.day1_part1

defmodule Adventofcode do
    @moduledoc """
    Exercises for a pretty cool https://adventofcode.com/ Elixir training/tutorial
    """

    def day1_part1() do
        mass = File.read!("lib/input.day1") |> String.split("\n", trim: true) |> Enum.map(&String.to_integer/1)
        Enum.map(mass, &calc_fuel/1) |> Enum.reduce(&+/2)
    end

    def day1_part2() do
        mass = File.read!("lib/input.day1") |> String.split("\n", trim: true) |> Enum.map(&String.to_integer/1)
        Enum.map(mass, &calc_total_fuel/1) |> Enum.reduce(&+/2)
    end

    def calc_total_fuel(mass), do: calc_total_fuel(mass, 0)

    defp calc_total_fuel(mass, accum) do
        fuel = calc_fuel(mass)
        cond do
            fuel == 0 -> accum
            true -> calc_total_fuel(fuel, accum + fuel)
        end
    end

    defp calc_fuel(mass) do
        fuel = div(mass, 3) - 2
        cond do
            fuel <= 0 -> 0
            true -> fuel
        end
    end
end

IO.puts Adventofcode.day1_part2

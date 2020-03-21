import List, only: [replace_at: 3]
import Enum, only: [at: 2]

defmodule Adventofcode do
    @moduledoc """
    Exercises for a pretty cool https://adventofcode.com/ coding challenge
    """

    def day1_part1() do
        mass = File.read!("lib/input.day1") |> String.split("\n", trim: true) |> Enum.map(&String.to_integer/1)
        Enum.map(mass, &calc_fuel/1) |> Enum.reduce(&+/2)
    end

    def day1_part2() do
        mass = File.read!("lib/input.day1") |> String.split("\n", trim: true) |> Enum.map(&String.to_integer/1)
        Enum.map(mass, &calc_total_fuel/1) |> Enum.reduce(&+/2)
    end

    def day2_part1() do
        intcode = File.read!("lib/input.day2") |> String.trim() |> String.split(",", trim: true)
        intcode = Enum.map(intcode, &String.to_integer/1) |> replace_at(1, 12) |> replace_at(2, 2)
        intcode = eval_intcode(intcode)
        at(intcode, 0)
    end

    def calc_total_fuel(mass), do: calc_total_fuel(mass, 0)

    defp calc_total_fuel(mass, accum) do
        fuel = calc_fuel(mass)
        cond do
            fuel == 0 -> accum
            true -> calc_total_fuel(fuel, accum + fuel)
        end
    end

    defp eval_intcode(intcode, offset \\ 0) do
        case at(intcode, offset) do
            99 -> intcode
            1 -> do_op(intcode, offset, &+/2) |> eval_intcode(offset + 4)
            2 -> do_op(intcode, offset, &*/2) |> eval_intcode(offset + 4)
        end
    end

    defp do_op(intcode, offset, op) do
        op1 = at(intcode, at(intcode, 1 + offset))
        op2 = at(intcode, at(intcode, 2 + offset))
        replace_at(intcode, at(intcode, 3 + offset), op.(op1, op2))
    end

    defp calc_fuel(mass) do
        fuel = div(mass, 3) - 2
        cond do
            fuel <= 0 -> 0
            true -> fuel
        end
    end
end

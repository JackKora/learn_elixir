defmodule AdventofcodeTest do
  use ExUnit.Case
  doctest Adventofcode

  test "day 1, part 1" do
    assert Adventofcode.day1_part1() == 3285627
  end

  test "day 1, part 2" do
    assert Adventofcode.day1_part2() == 4925580
  end

  test "day 2, part 1" do
    assert Adventofcode.day2_part1() == 6087827
  end

  test "calculate total fuel" do
    assert Adventofcode.calc_total_fuel(14) == 2
    assert Adventofcode.calc_total_fuel(100756) == 50346
  end
end

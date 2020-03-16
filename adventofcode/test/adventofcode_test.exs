defmodule AdventofcodeTest do
  use ExUnit.Case
  doctest Adventofcode

  test "day 1, part 1" do
    assert Adventofcode.day1_part1() == 3285627
  end
end

defmodule Aoc2021.Day7Test do
  use ExUnit.Case, async: true

  alias Aoc2021.Day7

  test "part_one" do
    input = """
    16,1,2,0,4,2,7,1,2,14
    """

    assert Day7.part_one(input) == 37
  end

  test "part_two" do
    input = """
    16,1,2,0,4,2,7,1,2,14
    """

    assert Day7.part_two(input) == 168
  end
end

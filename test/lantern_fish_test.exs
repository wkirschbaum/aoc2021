defmodule Aoc2021.LaternFishTest do
  use ExUnit.Case, async: true

  test "population growth" do
    input = "3,4,3,1,2"

    assert Aoc2021.LaternFish.growth(input) == 26_984_457_539
  end
end

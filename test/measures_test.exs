defmodule Aoc2021.StatsTest do
  use ExUnit.Case

  alias Aoc2021.Stats

  test "measure empty list" do
    assert Stats.increases([]) == 0
  end

  test "measure single element list" do
    assert Stats.increases([1]) == 0
  end

  test "measure even list" do
    measurements = [
      199,
      200,
      208,
      210,
      200,
      207,
      240,
      269,
      260,
      263
    ]

    assert Stats.increases(measurements) == 7
  end

  test "measure odd list" do
    measurements = [
      199,
      200,
      210,
      200,
      207,
      240,
      269,
      260,
      263
    ]

    assert Stats.increases(measurements) == 6
  end
end

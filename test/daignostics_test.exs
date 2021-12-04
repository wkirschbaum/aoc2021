defmodule Aoc2021.DiagnosticsTest do
  use ExUnit.Case

  alias Aoc2021.Diagnostics

  @input [
    "00100",
    "11110",
    "10110",
    "10111",
    "10101",
    "01111",
    "00111",
    "11100",
    "10000",
    "11001",
    "00010",
    "01010"
  ]

  test "gamma" do
    assert Diagnostics.gamma(@input) == 22
  end

  test "epsilon" do
    assert Diagnostics.epsilon(@input) == 9
  end

  test "power_consumption" do
    assert Diagnostics.power_consumption(@input) == 198
  end

  test "o2" do
    assert Diagnostics.o2(@input) == 23
  end

  test "co2" do
    assert Diagnostics.co2(@input) == 10
  end

  test "life_support" do
    assert Diagnostics.life_support(@input) == 230
  end
end

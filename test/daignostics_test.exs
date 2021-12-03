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

  test "gamma_rate" do
    assert Diagnostics.gamma_rate(@input) == 22
  end

  test "epsilon_rate" do
    assert Diagnostics.epsilon_rate(@input) == 9
  end

  test "power_consumption" do
    assert Diagnostics.power_consumption(@input) == 198
  end

  test "oxygen_generator_rating" do
    assert Diagnostics.oxygen_generator_rating(@input) == 23
  end

  test "co2_scrubber_rating" do
    assert Diagnostics.co2_scrubber_rating(@input) == 10
  end

  test "life_support_rating" do
    assert Diagnostics.life_support_rating(@input) == 230
  end
end

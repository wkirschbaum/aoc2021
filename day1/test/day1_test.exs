defmodule Day1Test do
  use ExUnit.Case
  doctest Day1

  test "measure empty list" do
    assert Day1.increases([]) == 0
  end

  test "measure single element list" do
    assert Day1.increases([1]) == 0
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

    assert Day1.increases(measurements) == 7
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

    assert Day1.increases(measurements) == 6
  end
end

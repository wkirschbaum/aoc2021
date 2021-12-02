defmodule Aoc2021.SonarTest do
  use ExUnit.Case

  alias Aoc2021.Sonar

  describe "increases with default settings" do
    test "measure empty list" do
      assert Sonar.increases([]) == 0
    end

    test "measure single element list" do
      assert Sonar.increases([1]) == 0
    end

    test "measure list" do
      measurements = [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]

      assert Sonar.increases(measurements) == 7
    end
  end

  describe "increases with sliding window of 3" do
    setup do
      {:ok, window: 3}
    end

    test "measure empty list", %{window: window} do
      assert Sonar.increases([], window: window) == 0
    end

    test "measure single element list", %{window: window} do
      assert Sonar.increases([1], window: window) == 0
    end

    test "measure dual element list", %{window: window} do
      assert Sonar.increases([1, 2], window: window) == 0
    end

    test "measure triple element list", %{window: window} do
      assert Sonar.increases([1, 2, 3], window: window) == 0
    end

    test "measure 4 element list", %{window: window} do
      assert Sonar.increases([1, 2, 3, 99], window: window) == 1
    end

    test "measure list", %{window: window} do
      measurements = [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]

      assert Sonar.increases(measurements, window: window) == 5
    end
  end
end

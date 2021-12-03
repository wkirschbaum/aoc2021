defmodule Aoc2021.NavigationTest do
  use ExUnit.Case

  alias Aoc2021.Navigation
  alias Aoc2021.Submarine

  describe "navigate" do
    test "navigate with no directions" do
      assert Navigation.navigate([]) == %Submarine{x: 0, y: 0, aim: 0}
    end

    test "navigate 1 forward" do
      assert Navigation.navigate(["forward 1"]) == %Submarine{x: 1, y: 0, aim: 0}
    end

    test "navigate 1 up" do
      assert Navigation.navigate(["up 1"]) == %Submarine{x: 0, y: 0, aim: -1}
    end

    test "navigate 1 down" do
      assert Navigation.navigate(["down 1"]) == %Submarine{x: 0, y: 0, aim: 1}
    end

    test "case 1" do
      directions = ["forward 5", "down 5", "forward 8", "up 3", "down 8", "forward 2"]

      result =
        Navigation.navigate(directions)
        |> Submarine.product()

      assert result == 900
    end
  end
end

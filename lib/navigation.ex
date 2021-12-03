defmodule Aoc2021.Navigation do
  alias Aoc2021.Submarine

  def navigate(directions) do
    Enum.reduce(directions, Submarine.new(), fn
      "forward " <> distance, pos ->
        Submarine.forward(pos, String.to_integer(distance))

      "up " <> distance, pos ->
        Submarine.up(pos, String.to_integer(distance))

      "down " <> distance, pos ->
        Submarine.down(pos, String.to_integer(distance))
    end)
  end
end

defmodule Aoc2021.Navigation do
  alias Aoc2021.Position

  def navigate(directions) do
    Enum.reduce(directions, Position.new(), fn
      "forward " <> distance, pos ->
        Position.forward(pos, String.to_integer(distance))

      "up " <> distance, pos ->
        Position.up(pos, String.to_integer(distance))

      "down " <> distance, pos ->
        Position.down(pos, String.to_integer(distance))
    end)
  end
end

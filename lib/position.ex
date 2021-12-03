defmodule Aoc2021.Position do
  defstruct [:x, :y]

  alias Aoc2021.Position

  def new() do
    %Position{x: 0, y: 0}
  end

  def product(%Position{x: x, y: z}), do: x * z

  def forward(%Position{x: x} = position, distance) do
    %{position | x: x + distance}
  end

  def up(%Position{y: y} = position, distance) do
    %{position | y: y - distance}
  end

  def down(%Position{y: y} = position, distance) do
    %{position | y: y + distance}
  end
end

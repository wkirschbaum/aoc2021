defmodule Aoc2021.Position do
  defstruct [:x, :y, :aim]

  alias Aoc2021.Position

  def new() do
    %Position{x: 0, y: 0, aim: 0}
  end

  def product(%Position{x: x, y: z}), do: x * z

  def forward(%Position{y: y, x: x, aim: aim} = position, distance) do
    %{position | x: x + distance, y: y + aim * distance}
  end

  def up(%Position{aim: aim} = position, distance) do
    %{position | aim: aim - distance}
  end

  def down(%Position{aim: aim} = position, distance) do
    %{position | aim: aim + distance}
  end
end

defmodule Aoc2021.Submarine do
  defstruct [:x, :y, :aim]

  alias Aoc2021.Submarine

  def new() do
    %Submarine{x: 0, y: 0, aim: 0}
  end

  def product(%Submarine{x: x, y: z}), do: x * z

  def forward(%Submarine{y: y, x: x, aim: aim} = position, distance) do
    %{position | x: x + distance, y: y + aim * distance}
  end

  def up(%Submarine{aim: aim} = position, distance) do
    %{position | aim: aim - distance}
  end

  def down(%Submarine{aim: aim} = position, distance) do
    %{position | aim: aim + distance}
  end
end

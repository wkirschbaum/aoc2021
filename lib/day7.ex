defmodule Aoc2021.Day7 do
  def part_one(input) do
    find_min_cost(input, & &1)
  end

  def part_two(input) do
    find_min_cost(input, &div(&1 * (&1 + 1), 2))
  end

  defp find_min_cost(input, cost) do
    xs =
      input
      |> String.split("\n", trim: true)
      |> Enum.flat_map(&String.split(&1, ","))
      |> Enum.map(&String.to_integer/1)

    for x <- Enum.min(xs)..Enum.max(xs) do
      Enum.reduce(xs, 0, fn xa, sum -> sum + cost.(abs(xa - x)) end)
    end
    |> Enum.min()
  end
end

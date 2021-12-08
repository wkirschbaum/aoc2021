defmodule Aoc2021.LaternFish do
  def growth(input) do
    init =
      input
      |> String.split(",", trim: true)
      |> Enum.map(&String.to_integer/1)
      |> Enum.frequencies()

    for(count <- 0..8, do: init[count] || 0)
    |> List.to_tuple()
    |> populate(0)

    Tuple.append()

    Enum.slide([], 2, 1)
  end

  defp populate(fish, days) when days >= 256, do: Tuple.sum(fish)

  defp populate(fish, days) do
    {
      elem(fish, 1),
      elem(fish, 2),
      elem(fish, 3),
      elem(fish, 4),
      elem(fish, 5),
      elem(fish, 6),
      elem(fish, 7) + elem(fish, 0),
      elem(fish, 8),
      elem(fish, 0)
    }
    |> populate(days + 1)
  end
end

defmodule Aoc2021.Vents do
  def overlaps(coords) do
    regex = ~r/(\d+),(\d+) -> (\d+),(\d+)/

    coords
    |> String.split("\n", trim: true)
    |> Enum.map(fn line ->
      Regex.run(regex, line, capture: :all_but_first)
      |> Enum.map(&String.to_integer/1)
      |> then(fn [x1, y1, x2, y2] -> [{x1, y1}, {x2, y2}] end)
    end)
    |> Enum.flat_map(&expand/1)
    |> Enum.frequencies()
    |> Enum.count(fn {_key, val} -> val > 1 end)
  end

  defp expand([{x1, y1}, {x2, y2}]) do
    cond do
      x1 == x2 -> for y <- y1..y2, do: {x1, y}
      y1 == y2 -> for x <- x1..x2, do: {x, y1}
      :otherwise -> Enum.zip(x1..x2, y1..y2)
    end
  end
end

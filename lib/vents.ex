defmodule Aoc2021.Vents do
  def overlaps(coords) do
    coords
    |> String.split("\n", trim: true)
    |> Enum.map(&String.split(&1, "->", trim: true))
    |> Enum.flat_map(&expand/1)
    |> count()
  end

  defp count(coords) do
    Enum.frequencies(coords)
    |> Enum.filter(fn {_key, val} -> val > 1 end)
    |> Enum.count()
  end

  defp expand([a, b]) do
    [x1, y1] = to_coord(a)
    [x2, y2] = to_coord(b)

    cond do
      x1 == x2 -> for y <- y1..y2, do: {x1, y}
      y1 == y2 -> for x <- x1..x2, do: {x, y1}
      abs(y1 - y2) == abs(x1 - x2) -> Enum.zip(x1..x2, y1..y2)
      :otherwise -> []
    end
  end

  defp to_coord(val) do
    val
    |> String.split(",")
    |> Enum.map(fn val -> String.trim(val) |> String.to_integer() end)
  end
end

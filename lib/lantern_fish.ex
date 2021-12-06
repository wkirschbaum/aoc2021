defmodule Aoc2021.LaternFish do
  def growth(input) do
    fish =
      input
      |> String.trim()
      |> String.split(",", trim: true)
      |> Enum.map(&String.to_integer/1)

    populate(fish, 0)
  end

  defp populate(fish, days) when days >= 80, do: Enum.count(fish)

  defp populate(fish, days) do
    populate(Enum.flat_map(fish, &tick/1), days + 1)
  end

  defp tick(fish) do
    case fish do
      0 -> [6, 8]
      days -> [days - 1]
    end
  end
end

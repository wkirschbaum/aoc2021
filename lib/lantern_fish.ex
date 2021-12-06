defmodule Aoc2021.LaternFish do
  def growth(input) do
    fish =
      input
      |> String.trim()
      |> String.split(",", trim: true)
      |> Enum.map(&String.to_integer/1)
      |> Enum.frequencies()

    fish =
      for count <- 0..8, into: %{} do
        case fish[count] do
          nil -> {count, 0}
          val -> {count, val}
        end
      end

    populate(fish, 0)
  end

  defp populate(fish, days) when days >= 256, do: Enum.sum(Map.values(fish))

  defp populate(fish, days) do
    populate(
      %{
        0 => fish[1],
        1 => fish[2],
        2 => fish[3],
        3 => fish[4],
        4 => fish[5],
        5 => fish[6],
        6 => fish[7] + fish[0],
        7 => fish[8],
        8 => fish[0]
      },
      days + 1
    )
  end
end

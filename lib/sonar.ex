defmodule Aoc2021.Sonar do
  def increases(measurements, opts \\ [])

  def increases(measurements, opts) do
    Enum.chunk_every(measurements, Keyword.get(opts, :window, 1), 1)
    |> Enum.map(&Enum.sum/1)
    |> count_increases()
  end

  defp count_increases([]), do: 0
  defp count_increases([_]), do: 0

  defp count_increases([curr, next | rest]) do
    if(next > curr, do: 1, else: 0) + increases([next | rest])
  end
end

defmodule Mix.Tasks.Day1 do
  use Mix.Task

  @impl Mix.Task
  def run(_) do
    File.stream!('input-day1.txt')
    |> Enum.map(fn line -> String.trim(line) |> String.to_integer() end)
    |> Aoc2021.Stats.increases()
    |> IO.puts()
  end
end

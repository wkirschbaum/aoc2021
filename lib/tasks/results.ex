defmodule Mix.Tasks.Results do
  use Mix.Task

  @impl Mix.Task
  def run(_) do
    puts("day1.1", fn ->
      inputs("input-1")
      |> Aoc2021.Sonar.increases(window: 3)
    end)

    puts("day1.2", fn ->
      inputs("input-1") |> Aoc2021.Sonar.increases(window: 3)
    end)
  end

  defp inputs(name) do
    File.stream!("inputs/#{name}.txt")
    |> Enum.map(fn line -> String.trim(line) |> String.to_integer() end)
  end

  defp puts(text, func) do
    IO.puts("-#{text}-")
    IO.puts(func.())
    IO.puts("===")
  end
end

defmodule Mix.Tasks.Measure do
  use Mix.Task

  def run(_) do
    File.stream!('input.txt')
    |> Enum.map(fn line -> String.trim(line) |> String.to_integer() end)
    |> Day1.increases()
    |> IO.inspect()
  end
end

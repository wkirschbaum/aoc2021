defmodule Mix.Tasks.Results do
  use Mix.Task

  @impl Mix.Task
  def run(_) do
    puts("day1.1", fn ->
      inputs("input-1")
      |> Enum.map(&String.to_integer/1)
      |> Aoc2021.Sonar.increases(window: 3)
    end)

    puts("day1.2", fn ->
      inputs("input-1")
      |> Enum.map(&String.to_integer/1)
      |> Aoc2021.Sonar.increases(window: 3)
    end)

    puts("day2.1", fn ->
      inputs("input-2")
      |> Aoc2021.Navigation.navigate()
      |> Aoc2021.Submarine.position_product()
    end)

    puts("day3.1", fn ->
      inputs("input-3")
      |> Aoc2021.Diagnostics.power_consumption()
    end)

    puts("day3.2", fn ->
      inputs("input-3")
      |> Aoc2021.Diagnostics.life_support()
    end)
  end

  defp inputs(name) do
    File.stream!("inputs/#{name}.txt")
    |> Enum.map(&String.trim/1)
  end

  defp puts(text, func) do
    IO.puts("-#{text}-")
    IO.puts(func.())
    IO.puts("===")
  end
end

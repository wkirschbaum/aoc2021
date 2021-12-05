defmodule Mix.Tasks.Results do
  use Mix.Task

  @impl Mix.Task
  def run(_) do
    puts("day1.1", fn ->
      inputs("input-1")
      |> String.split("\n", trim: true)
      |> Enum.map(&String.to_integer/1)
      |> Aoc2021.Sonar.increases(window: 3)
    end)

    puts("day1.2", fn ->
      inputs("input-1")
      |> String.split("\n", trim: true)
      |> Enum.map(&String.to_integer/1)
      |> Aoc2021.Sonar.increases(window: 3)
    end)

    puts("day2.1", fn ->
      inputs("input-2")
      |> String.split("\n", trim: true)
      |> Aoc2021.Navigation.navigate()
      |> Aoc2021.Submarine.position_product()
    end)

    puts("day3.1", fn ->
      inputs("input-3")
      |> String.split("\n", trim: true)
      |> Aoc2021.Diagnostics.power_consumption()
    end)

    puts("day3.2", fn ->
      inputs("input-3")
      |> String.split("\n", trim: true)
      |> Aoc2021.Diagnostics.life_support()
    end)

    puts("day4.1", fn ->
      inputs("input-4")
      |> Aoc2021.Bingo.winning_board()
    end)

    puts("day4.2", fn ->
      inputs("input-4")
      |> Aoc2021.Bingo.loosing_board()
    end)

    puts("day5.1", fn ->
      inputs("input-5")
      |> Aoc2021.Vents.overlaps()
    end)
  end

  defp inputs(name) do
    File.read!("inputs/#{name}.txt")
  end

  defp puts(text, func) do
    IO.puts("-#{text}-")
    IO.puts(func.())
    IO.puts("===")
  end
end

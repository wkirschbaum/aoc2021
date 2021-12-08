defmodule Aoc2021.Day8 do
  defp lines(input) do
    String.split(input, "\n", trim: true)
  end

  def part_one(input) do
    lines(input)
    |> Enum.flat_map(fn line ->
      [_input, output] = String.split(line, "|", trim: true)
      String.split(output, " ", trim: true)
    end)
    |> Enum.count(fn output -> String.length(output) in [2, 4, 3, 7] end)
  end

  def part_two(input) do
    lines(input)
    |> Enum.map(fn line ->
      [input, output] = String.split(line, "|", trim: true)
      {String.split(input, " ", trim: true), String.split(output, " ", trim: true)}
    end)
    |> Enum.map(&decode_line/1)
  end

  # 1 ( 2) , 4 ( 4 ) , 7 ( 3 ), 8 ( 8)

  # 2 = 8 - 2
  #

  defp find_by_length(inputs, length) do
    Enum.find(inputs, fn input -> String.length(input) == length end)
  end

  defp decode_line({inputs, _outputs}) do
    one = find_by_length(inputs, 2)
    four = find_by_length(inputs, 4)
    seven = find_by_length(inputs, 3)
    eight = find_by_length(inputs, 7)

    Enum.map(inputs, fn input ->
      cond do
        input == one ->
          1

        input == four ->
          4

        input == seven ->
          7

        input == eight ->
          8

        contains(input, one) and contains(input, seven) ->
          0

        contains(input, one) and contains(input, seven) ->
          3

        !contains(input, one) and !contains(input, seven) and !contains(input, four) ->
          2

        :otherwise ->
          input
      end
    end)
    |> IO.inspect()
  end

  defp contains(input, val) do
    input =~ ~r/^[#{val}]+$/
  end

  defp final_map(code) do
    %{
      "abcefg" => 0,
      "cf" => 1,
      "acdfg" => 2,
      "acdfg" => 3,
      "bcdf" => 4,
      "abdfg" => 5,
      "abdefg" => 6,
      "acf" => 7,
      "abcdefg" => 8,
      "abcdfg" => 9
    }
    |> Map.get(sort(code))
  end

  defp sort(code) do
    String.codepoints(code) |> Enum.sort() |> Enum.join()
  end
end

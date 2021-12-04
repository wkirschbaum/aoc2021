defmodule Aoc2021.Diagnostics do
  use Bitwise

  def power_consumption(inputs) do
    gamma(inputs) * epsilon(inputs)
  end

  def gamma(inputs) do
    most_common_bits(inputs, &if(&1 > &2, do: ?0, else: ?1))
    |> to_decimal()
  end

  def epsilon(inputs) do
    most_common_bits(inputs, &if(&1 > &2, do: ?1, else: ?0))
    |> to_decimal()
  end

  def life_support(inputs) do
    o2(inputs) * co2(inputs)
  end

  def o2(inputs) do
    filter_inputs(inputs, &if(&1 > &2, do: ?0, else: ?1), 0)
  end

  def co2(inputs) do
    filter_inputs(inputs, &if(&1 > &2, do: ?1, else: ?0), 0)
  end

  defp filter_inputs([input], _, _), do: input |> to_decimal()

  defp filter_inputs(inputs, func, pos) do
    bit = Enum.at(most_common_bits(inputs, func), pos)
    left = Enum.filter(inputs, &(Enum.at(String.to_charlist(&1), pos) == bit))

    filter_inputs(left, func, pos + 1)
  end

  defp most_common_bits(inputs, func) do
    half = div(length(inputs), 2)

    for pos <- 0..(String.length(List.first(inputs)) - 1) do
      Enum.count(inputs, &(String.to_charlist(&1) |> Enum.at(pos) == ?0))
      |> func.(half)
    end
  end

  defp to_decimal(val), do: String.to_integer(to_string(val), 2)
end

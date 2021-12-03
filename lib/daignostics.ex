defmodule Aoc2021.Diagnostics do
  use Bitwise

  def power_consumption(inputs) do
    gamma_rate(inputs) * epsilon_rate(inputs)
  end

  def gamma_rate(inputs) do
    most_common_bits(inputs)
    |> to_decimal()
  end

  def epsilon_rate(inputs) do
    least_common_bits(inputs)
    |> to_decimal()
  end

  def life_support_rating(inputs) do
    oxygen_generator_rating(inputs) * co2_scrubber_rating(inputs)
  end

  def oxygen_generator_rating(inputs) do
    ratings = Enum.map(inputs, fn val -> String.split(val, "", trim: true) end)

    func = fn ratings, pos -> Enum.at(most_common_bits(ratings), pos) end

    filter_ratings(ratings, [], 0, func.(ratings, 0), func)
  end

  def co2_scrubber_rating(inputs) do
    ratings = Enum.map(inputs, fn val -> String.split(val, "", trim: true) end)

    func = fn ratings, pos -> Enum.at(least_common_bits(ratings), pos) end

    filter_ratings(ratings, [], 0, func.(ratings, 0), func)
  end

  def filter_ratings([], [filtered], _, _, _), do: to_decimal(filtered)

  def filter_ratings([], filtered, pos, _common, func) do
    pos = pos + 1

    filter_ratings(
      Enum.reverse(filtered),
      [],
      pos,
      func.(filtered, pos),
      func
    )
  end

  def filter_ratings([rating | ratings], filtered, pos, common, func) do
    if Enum.at(rating, pos) == common do
      filter_ratings(ratings, [rating | filtered], pos, common, func)
    else
      filter_ratings(ratings, filtered, pos, common, func)
    end
  end

  def least_common_bits(inputs) do
    most_common_bits(inputs)
    |> Enum.map(fn
      "0" -> "1"
      "1" -> "0"
    end)
  end

  def most_common_bits(inputs) do
    bit_frequencies(inputs)
    |> Enum.map(fn
      %{"0" => zero, "1" => one} ->
        if zero > one, do: "0", else: "1"

      %{"0" => _} ->
        "0"

      %{"1" => _} ->
        "1"
    end)
  end

  defp bit_frequencies(inputs) do
    Enum.map(inputs, fn
      val when is_binary(val) -> String.split(val, "", trim: true)
      val -> val
    end)
    |> List.zip()
    |> Enum.map(&Tuple.to_list/1)
    |> Enum.map(&Enum.frequencies/1)
  end

  defp to_decimal(bits) do
    bits
    |> Enum.join()
    |> String.to_integer(2)
  end
end

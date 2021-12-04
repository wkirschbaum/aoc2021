defmodule Aoc2021.Bingo do
  def winning_board(input) do
    lines = String.split(input, "\n", trim: true)
    play_winning(read_boards(lines), read_inputs(lines))
  end

  def loosing_board(input) do
    lines = String.split(input, "\n", trim: true)
    play_loosing(read_boards(lines), read_inputs(lines))
  end

  defp play_winning(boards, [number | numbers]) do
    boards = mark_numbers(boards, number)

    for board <- boards do
      if win_horizontal?(board) or win_vertical?(board) do
        score(board) * String.to_integer(number)
      end
    end
    |> Enum.find(&is_integer/1) || play_winning(boards, numbers)
  end

  defp play_loosing(boards, [number | numbers]) do
    boards =
      Enum.reject(mark_numbers(boards, number), fn board ->
        win_horizontal?(board) or win_vertical?(board)
      end)

    case boards do
      [_board] -> play_winning(boards, numbers)
      _ -> play_loosing(boards, numbers)
    end
  end

  defp mark_numbers(boards, number) do
    for board <- boards do
      for row <- board do
        for col <- row do
          if col == number, do: nil, else: col
        end
      end
    end
  end

  defp score(board) do
    board
    |> List.flatten()
    |> Enum.reject(&is_nil/1)
    |> Enum.map(&String.to_integer/1)
    |> Enum.sum()
  end

  defp win_vertical?(rows) do
    Enum.any?(0..4, fn col ->
      Enum.count(rows, fn row -> is_nil(Enum.at(row, col)) end) == 5
    end)
  end

  defp win_horizontal?([]), do: false

  defp win_horizontal?([row | rows]) do
    if Enum.count(row, &is_nil/1) == 5, do: true, else: win_horizontal?(rows)
  end

  defp read_boards(lines) do
    for start <- 1..(length(lines) - 1)//5 do
      read_board(lines, start..(start + 4))
    end
  end

  defp read_board(lines, range) do
    for row <- range do
      Enum.at(lines, row)
      |> String.split(" ", trim: true)
    end
  end

  defp read_inputs([inputs | _]), do: String.split(inputs, ",", trim: true)
end

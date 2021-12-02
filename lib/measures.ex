defmodule Aoc2021.Stats do
  def increases([]), do: 0
  def increases([_]), do: 0

  def increases([curr, next | rest]) do
    if(next > curr, do: 1, else: 0) + increases([next | rest])
  end
end

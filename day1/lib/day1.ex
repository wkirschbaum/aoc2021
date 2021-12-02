defmodule Day1 do
  @moduledoc """
  Documentation for `Day1`.
  """
  def increases([]), do: 0
  def increases([_]), do: 0

  def increases([curr, next | rest]) do
    if(next > curr, do: 1, else: 0) + increases([next | rest])
  end
end

defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    d = x * x + y * y
    cond do
      d > 100 -> 0
      d > 25 -> 1
      d > 1 -> 5
      true -> 10
    end
  end
end

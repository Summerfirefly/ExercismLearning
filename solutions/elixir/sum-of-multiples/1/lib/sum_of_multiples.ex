defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    streams = for x <- factors do
                do_one(limit, x)
              end
    streams
    |> Stream.concat()
    |> MapSet.new()
    |> Enum.sum()
  end

  defp do_one(_, 0), do: [0]
  defp do_one(limit, num) do
    Stream.unfold(num, fn n -> if n < limit, do: {n, n + num}, else: nil end)
  end
end

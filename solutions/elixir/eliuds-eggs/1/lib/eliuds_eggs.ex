defmodule EliudsEggs do
  @doc """
  Given the number, count the number of eggs.
  """
  @spec egg_count(number :: integer()) :: non_neg_integer()
  def egg_count(number) when number >= 0 do
    egg_count(number, 0)
  end

  defp egg_count(0, count), do: count
  defp egg_count(number, count) do
    number
    |> Bitwise.bsr(1)
    |> egg_count(count + rem(number, 2))
  end
end

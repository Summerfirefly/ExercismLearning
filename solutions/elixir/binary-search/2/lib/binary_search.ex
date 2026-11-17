defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search({}, _), do: :not_found
  def search(numbers, key) do
    numbers
    |> Tuple.to_list
    |> Enum.sort
    |> bisearch(key, 0)
  end

  defp bisearch([], _, _), do: :not_found
  defp bisearch(numbers, key, offset) do
    mid_index = div(length(numbers), 2)
    mid = Enum.at(numbers, mid_index)
    cond do
      mid < key -> bisearch(Enum.slice(numbers, mid_index + 1, length(numbers) - mid_index - 1), key, offset + mid_index + 1)
      mid > key -> bisearch(Enum.slice(numbers, 0, mid_index), key, offset)
      mid == key -> {:ok, mid_index + offset}
    end
  end
end

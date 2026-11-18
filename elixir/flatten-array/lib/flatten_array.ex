defmodule FlattenArray do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1, 2, 3]

      iex> FlattenArray.flatten([nil, nil])
      []

  """

  @spec flatten(list) :: list
  def flatten(list), do: do_flatten(list, [], []) |> Enum.reverse()

  defp do_flatten([], [], result), do: result

  defp do_flatten([], pending_list, result) do
    do_flatten(pending_list, [], result)
  end

  defp do_flatten([nil | tail], pending_list, result) do
    do_flatten(tail, pending_list, result)
  end

  defp do_flatten([head | tail], pending_list, result) do
    if is_list(head) do
      do_flatten(head, tail ++ pending_list, result)
    else
      do_flatten(tail, pending_list, [head | result])
    end
  end
end


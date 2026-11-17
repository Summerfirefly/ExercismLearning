defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun) do
    do_keep(list, fun, [])
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun) do
    do_discard(list, fun, [])
  end

  defp do_keep([], _fun, result), do: result
  defp do_keep([first | rest], fun, result) do
    if fun.(first), do: do_keep(rest, fun, result ++ [first]), else: do_keep(rest, fun, result)
  end

  defp do_discard([], _fun, result), do: result
  defp do_discard([first | rest], fun, result) do
    if fun.(first), do: do_discard(rest, fun, result), else: do_discard(rest, fun, result ++ [first])
  end
end

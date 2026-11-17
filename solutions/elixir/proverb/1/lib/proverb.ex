defmodule Proverb do
  @doc """
  Generate a proverb from a list of strings.
  """
  @spec recite(strings :: [String.t()]) :: String.t()
  def recite([]), do: ""
  def recite(strings) do
    "#{do_recite(strings, "")}And all for the want of a #{List.first(strings)}.\n"
  end

  defp do_recite([], str), do: str
  defp do_recite([first | remain], str) do
    case remain do
      [] -> str
      [second | _] ->
        do_recite(remain, "#{str}For want of a #{first} the #{second} was lost.\n")
    end
  end
end

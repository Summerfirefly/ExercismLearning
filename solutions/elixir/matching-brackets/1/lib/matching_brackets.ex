defmodule MatchingBrackets do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t()) :: boolean
  def check_brackets(""), do: true
  def check_brackets(str) do
    String.to_charlist(str)
    |> Enum.reduce_while([], fn c, s ->
         case c do
           ch when ch == ?{ or ch == ?[ or ch == ?( -> {:cont, [c | s]}
           ch when ch == ?} or ch == ?] or ch == ?) ->
             if pair?(c, s) do
               [h | t] = s
               {:cont, t}
             else
               {:halt, [c | s]}
             end
           _ -> {:cont, s}
         end
       end)
    |> length() == 0
  end

  defp pair?(_char, []), do: false
  defp pair?(char, [h | t]) do
    case char do
      ?} -> h == ?{
      ?] -> h == ?[
      ?) -> h == ?(
      _  -> false
    end
  end
end

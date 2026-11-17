defmodule AllYourBase do
  @doc """
  Given a number in input base, represented as a sequence of digits, converts it to output base,
  or returns an error tuple if either of the bases are less than 2
  """

  @spec convert(list, integer, integer) :: {:ok, list} | {:error, String.t()}
  def convert(_, input_base, _) when input_base < 2, do: {:error, "input base must be >= 2"}
  def convert(_, _, output_base) when output_base < 2, do: {:error, "output base must be >= 2"}
  def convert([], _, _), do: {:ok, [0]}
  def convert(digits, input_base, output_base) do
    if valid?(digits, input_base) do
      number = Enum.reduce(digits, 0, fn d, acc -> acc * input_base + d end)
      case number do
        0 -> {:ok, [0]}
        _ -> output = Stream.unfold(number, fn acc ->
               case acc do
                 0 -> nil
                 _ -> {rem(acc, output_base), div(acc, output_base)}
               end
             end)
             |> Enum.reverse()
             {:ok, output}
      end
    else
      {:error, "all digits must be >= 0 and < input base"}
    end
  end

  defp valid?(digits, input_base) do
    Enum.all?(digits, &(&1 < input_base and &1 >= 0))
  end
end

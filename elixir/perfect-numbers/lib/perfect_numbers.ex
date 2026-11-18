defmodule PerfectNumbers do
  @doc """
  Determine the aliquot sum of the given `number`, by summing all the factors
  of `number`, aside from `number` itself.

  Based on this sum, classify the number as:

  :perfect if the aliquot sum is equal to `number`
  :abundant if the aliquot sum is greater than `number`
  :deficient if the aliquot sum is less than `number`
  """
  @spec classify(number :: integer) :: {:ok, atom} | {:error, String.t()}
  def classify(number) do
    cond do
      number < 1 -> {:error, "Classification is only possible for natural numbers."}
      true ->
        sum = Enum.filter(1..number, &(rem(number, &1) == 0 and number != &1))
          |> Enum.sum()
        cond do
          sum == number -> {:ok, :perfect}
          sum > number -> {:ok, :abundant}
          sum < number -> {:ok, :deficient}
        end
    end
  end
end

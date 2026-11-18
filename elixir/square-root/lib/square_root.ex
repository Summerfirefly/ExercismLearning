defmodule SquareRoot do
  @doc """
  Calculate the integer square root of a positive integer
  """
  @spec calculate(radicand :: pos_integer) :: pos_integer
  def calculate(radicand) do
    do_calculate(radicand, 1, radicand)
  end

  defp do_calculate(number, left, right) do
    mid = div(left + right, 2)
    mid_square = mid * mid
    cond do
      mid_square == number -> mid
      mid_square > number -> do_calculate(number, left, mid - 1)
      mid_square < number -> do_calculate(number, mid + 1, right)
    end
  end
end

defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) when rem(shift, 26) == 0, do: text
  def rotate(text, shift) do
    String.to_charlist(text)
    |> Enum.map(fn ch ->
         case ch do
           c when ?a <= c and ?z >= c -> if c + shift > ?z, do: c + shift - 26, else: c + shift
           c when ?A <= c and ?Z >= c -> if c + shift > ?Z, do: c + shift - 26, else: c + shift
           _ -> ch
         end
       end)
    |> List.to_string()
  end
end

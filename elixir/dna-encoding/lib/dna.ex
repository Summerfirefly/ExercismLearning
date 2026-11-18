defmodule DNA do
  def encode_nucleotide(code_point) do
    case code_point do
      32 -> 0
      ?A -> 1
      ?C -> 2
      ?G -> 4
      ?T -> 8
    end
  end

  def decode_nucleotide(encoded_code) do
    case encoded_code do
      0 -> 32
      1 -> ?A
      2 -> ?C
      4 -> ?G
      8 -> ?T
    end
  end

  def encode(dna) do
    do_encode(dna, <<>>)
  end

  def decode(dna) do
    do_decode(dna, [])
  end

  defp do_encode([], code), do: code
  defp do_encode([first | rest], code) do
    do_encode(rest, <<code::bitstring, encode_nucleotide(first)::4>>)
  end

  defp do_decode(<<>>, dna), do: dna
  defp do_decode(<<first::4, rest::bitstring>>, dna) do
    do_decode(rest, dna ++ [decode_nucleotide(first)])
  end
end

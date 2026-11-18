defmodule Transmission do
  @doc """
  Return the transmission sequence for a message.
  """
  @spec get_transmit_sequence(binary()) :: binary()
  def get_transmit_sequence(<<>>), do: <<>>

  def get_transmit_sequence(message) do
    encoded_msg =
      for <<data::7 <- message>>, into: <<>> do
        encoded = Bitwise.bsl(data, 1) + get_checkbit(data)
        <<encoded>>
      end

    encoded_bit = byte_size(encoded_msg) * 7
    rest_bit = bit_size(message) - byte_size(encoded_msg) * 7
    <<_::size(^encoded_bit), rest::size(^rest_bit)>> = message

    if rest_bit != 0 do
      last_byte = Bitwise.bsl(rest, 8 - rest_bit) + get_checkbit(rest)
      <<encoded_msg::bitstring, last_byte::8>>
    else
      encoded_msg
    end
  end

  @doc """
  Return the message decoded from the received transmission.
  """
  @spec decode_message(binary()) :: {:ok, binary()} | {:error, String.t()}
  def decode_message(<<>>), do: {:ok, <<>>}

  def decode_message(received_data) do
    if valid_binary?(received_data) do
      bin_msg =
        for <<data::7, _check::1 <- received_data>>, into: <<>> do
          <<data::7>>
        end

      actual_bit = div(byte_size(received_data) * 7, 8) * 8
      <<result::bitstring-size(^actual_bit), _::bitstring>> = bin_msg
      {:ok, result}
    else
      {:error, "wrong parity"}
    end
  end

  defp get_checkbit(data) do
    n =
      Enum.reduce(0..6, 0, fn i, acc ->
        acc + if Bitwise.band(Bitwise.bsl(1, i), data) == 0, do: 0, else: 1
      end)

    rem(n, 2)
  end

  defp valid_binary?(binary_data) do
    for <<byte <- binary_data>> do
      valid_checkbit?(byte)
    end
    |> Enum.all?()
  end

  defp valid_checkbit?(byte) do
    <<data::7, checkbit::1>> = <<byte>>

    n =
      Enum.reduce(0..6, 0, fn i, acc ->
        acc + if Bitwise.band(Bitwise.bsl(1, i), data) == 0, do: 0, else: 1
      end)

    rem(n + checkbit, 2) == 0
  end
end

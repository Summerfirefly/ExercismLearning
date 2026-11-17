defmodule SecretHandshake do
  @action_map %{
    0 => "wink",
    1 => "double blink",
    2 => "close your eyes",
    3 => "jump"
  }
  
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    commands(code, [], 0)
  end

  defp commands(_code, actions, acc) when acc > 4 do
    actions
  end

  defp commands(code, actions, acc) do
    if rem(code, 2) == 1 do
      new_actions = cond do
        acc < 4  -> actions ++ [@action_map[acc]]
        acc == 4 -> Enum.reverse(actions)
      end

      commands(Bitwise.bsr(code, 1), new_actions, acc + 1)
    else
      commands(Bitwise.bsr(code, 1), actions, acc + 1)
    end
  end
end

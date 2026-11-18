defmodule Bob do
  @spec hey(String.t()) :: String.t()
  def hey(input) do
    question? = input |> String.trim() |> String.ends_with?("?")
    shout? = input |> String.trim() |> is_shout?()
    silent? = input |> String.trim() |> String.length() == 0
    cond do
      silent? -> "Fine. Be that way!"
      question? -> if shout?, do: "Calm down, I know what I'm doing!", else: "Sure."
      shout? -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  defp is_shout?(input) do
    not (input =~ ~r/\p{Ll}/u) and (input =~ ~r/\p{Lu}/u)
  end
end

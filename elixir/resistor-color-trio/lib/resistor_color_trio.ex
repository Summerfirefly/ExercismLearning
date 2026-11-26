defmodule ResistorColorTrio do
  @colour_map %{
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9
  }

  @doc """
  Calculate the resistance value in ohms from resistor colors
  """
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms | :megaohms | :gigaohms}
  def label([first, second, third | _]) do
    base = @colour_map[first] * 10 + @colour_map[second]
    case @colour_map[third] do
      9 -> {base, :gigaohms}
      8 -> {base * 100, :megaohms}
      7 -> {base * 10, :megaohms}
      6 -> {base, :megaohms}
      5 -> {base * 100, :kiloohms}
      4 -> {base * 10, :kiloohms}
      3 -> {base, :kiloohms}
      2 -> cond do
        base * 100 >= 1000 -> {div(base, 10), :kiloohms}
        true -> {base, :ohms}
      end
      1 -> {base * 10, :ohms}
      _ -> {base, :ohms}
    end
  end
end

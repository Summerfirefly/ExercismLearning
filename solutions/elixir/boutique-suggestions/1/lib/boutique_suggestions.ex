defmodule BoutiqueSuggestions do
  def get_combinations(tops, bottoms, options \\ []) do
    max_price = if options[:maximum_price] == nil, do: 100, else: options[:maximum_price]
    for top <- tops, bottom <- bottoms,
        top[:base_color] != bottom[:base_color] and top[:price] + bottom[:price] <= max_price do
      {top, bottom}
    end
  end
end

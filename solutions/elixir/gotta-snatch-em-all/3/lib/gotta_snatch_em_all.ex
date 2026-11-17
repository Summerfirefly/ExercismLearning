defmodule GottaSnatchEmAll do
  @type card :: String.t()
  @type collection :: MapSet.t(card())

  @spec new_collection(card()) :: collection()
  def new_collection(card) do
    MapSet.new([card])
  end

  @spec add_card(card(), collection()) :: {boolean(), collection()}
  def add_card(card, collection) do
    {MapSet.member?(collection, card), MapSet.put(collection, card)}
  end

  @spec trade_card(card(), card(), collection()) :: {boolean(), collection()}
  def trade_card(your_card, their_card, collection) do
    worth_trade = MapSet.member?(collection, your_card) and not MapSet.member?(collection, their_card)
    new_collection = collection |> MapSet.put(their_card) |> MapSet.delete(your_card)
    {worth_trade, new_collection}
  end

  @spec remove_duplicates([card()]) :: [card()]
  def remove_duplicates(cards) do
    cards
    |> MapSet.new()
    |> MapSet.to_list()
    |> Enum.sort()
  end

  @spec extra_cards(collection(), collection()) :: non_neg_integer()
  def extra_cards(your_collection, their_collection) do
    your_collection
    |> MapSet.difference(their_collection)
    |> MapSet.size()
  end

  @spec boring_cards([collection()]) :: [card()]
  def boring_cards([]), do: []
  def boring_cards([first | []]), do: first
  def boring_cards([first | rest]) do
    rest
    |> Enum.reduce(MapSet.new(first), &(MapSet.intersection(&2, &1)))
    |> MapSet.to_list()
    |> Enum.sort()
  end

  @spec total_cards([collection()]) :: non_neg_integer()
  def total_cards(collections) do
    collections
    |> Enum.reduce(MapSet.new([]), &(MapSet.union(&1, &2)))
    |> MapSet.size()
  end

  @spec split_shiny_cards(collection()) :: {[card()], [card()]}
  def split_shiny_cards(collection) do
    {shiny_cards, normal_cards} = collection
      |> MapSet.split_with(&(String.starts_with?(&1, "Shiny")))
    {Enum.sort(MapSet.to_list(shiny_cards)), Enum.sort(MapSet.to_list(normal_cards))}
  end
end

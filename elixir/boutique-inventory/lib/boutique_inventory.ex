defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    inventory
    |> Enum.sort_by(fn i -> i[:price] end)
  end

  def with_missing_price(inventory) do
    inventory
    |> Enum.filter(fn item -> item[:price] == nil end)
  end

  def update_names(inventory, old_word, new_word) do
    inventory
    |> Enum.map(fn item -> Map.replace(item, :name, String.replace(item[:name], old_word, new_word)) end)
  end

  def increase_quantity(item, count) do
    new_quantity = item[:quantity_by_size]
      |> Map.new(fn {k, v} -> {k, v + count} end)
    item
    |> Map.replace(:quantity_by_size, new_quantity)
  end

  def total_quantity(item) do
    item[:quantity_by_size]
      |> Enum.reduce(0, fn {_, v}, acc -> acc + v end)
  end
end

defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    {_, volume} = volume_pair
    volume
  end

  def to_milliliter(_volume_pair = {:milliliter, v}) do
    {:milliliter, v}
  end

  def to_milliliter(_volume_pair = {:cup, v}) do
    {:milliliter, v * 240}
  end

  def to_milliliter(_volume_pair = {:fluid_ounce, v}) do
    {:milliliter, v * 30}
  end

  def to_milliliter(_volume_pair = {:teaspoon, v}) do
    {:milliliter, v * 5}
  end

  def to_milliliter(_volume_pair = {:tablespoon, v}) do
    {:milliliter, v * 15}
  end

  def from_milliliter(volume_pair, unit = :milliliter) do
    {_, ml} = volume_pair
    {unit, ml}
  end

  def from_milliliter(volume_pair, unit = :cup) do
    {_, ml} = volume_pair
    {unit, ml / 240}
  end

  def from_milliliter(volume_pair, unit = :fluid_ounce) do
    {_, ml} = volume_pair
    {unit, ml / 30}
  end

  def from_milliliter(volume_pair, unit = :teaspoon) do
    {_, ml} = volume_pair
    {unit, ml / 5}
  end

  def from_milliliter(volume_pair, unit = :tablespoon) do
    {_, ml} = volume_pair
    {unit, ml / 15}
  end

  def convert(volume_pair, unit) do
    from_milliliter(to_milliliter(volume_pair), unit)
  end
end

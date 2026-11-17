defmodule CaptainsLog do
  @planetary_classes ["D", "H", "J", "K", "L", "M", "N", "R", "T", "Y"]

  def random_planet_class() do
    rand_index = :rand.uniform(length(@planetary_classes)) - 1
    Enum.at(@planetary_classes, rand_index)
  end

  def random_ship_registry_number() do
    rand_num = :rand.uniform(9000) + 999
    "NCC-#{rand_num}"
  end

  def random_stardate() do
    :rand.uniform() * 1000 + 41000
  end

  def format_stardate(stardate) do
    "#{:io_lib.format("~.1f", [stardate])}"
  end
end

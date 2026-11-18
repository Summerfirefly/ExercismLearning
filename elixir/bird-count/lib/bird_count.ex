defmodule BirdCount do
  def today([]), do: nil
  def today(list) do
    [first | _] = list
    first
  end

  def increment_day_count([]), do: [1]
  def increment_day_count(list) do
    [first | remain] = list
    [first + 1 | remain]
  end

  def has_day_without_birds?(list) do
    cond do
      today(list) == 0 -> true
      today(list) == nil -> false
      true -> 
        [_first | remain] = list
        has_day_without_birds?(remain)
    end
  end

  def total(list) do
    total(list, 0)
  end

  defp total(list, count) do
    case list do
      [] -> count
      _ ->
        [today | remain] = list
        total(remain, count + today)
    end
  end

  def busy_days(list) do
    busy_days(list, 0)
  end

  defp busy_days(list, count) do
    cond do
      today(list) == nil -> count
      today(list) >= 5 ->
        [_today | remain] = list
        busy_days(remain, count + 1)
      true ->
        [_today | remain] = list
        busy_days(remain, count)
    end
  end
end

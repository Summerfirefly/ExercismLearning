defmodule Lasagna do
  def expected_minutes_in_oven do
    40
  end

  def remaining_minutes_in_oven(t) do
    expected_minutes_in_oven() - t
  end

  def preparation_time_in_minutes(n) do
    2 * n
  end

  def total_time_in_minutes(n, t) do
    preparation_time_in_minutes(n) + t
  end

  def alarm do
    "Ding!"
  end
end

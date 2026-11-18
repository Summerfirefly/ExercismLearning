defmodule LogLevel do
  def to_label(level, legacy?) do
    case level do
      0 -> cond do
        legacy? -> :unknown
        true -> :trace
      end
      1 -> :debug
      2 -> :info
      3 -> :warning
      4 -> :error
      5 -> cond do
        legacy? -> :unknown
        true -> :fatal
      end
      _ -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    label = to_label(level, legacy?)
    cond do
      label == :error -> :ops
      label == :fatal -> :ops
      label == :unknown -> cond do
        legacy? -> :dev1
        true -> :dev2
      end
      true -> false
    end
  end
end

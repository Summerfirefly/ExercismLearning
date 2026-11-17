defmodule Chessboard do
  def rank_range do
    1..8
  end

  def file_range do
    ?A..?H
  end

  def ranks do
    Enum.reduce(rank_range(), [], fn n, ranks -> ranks ++ [n] end)
  end

  def files do
    Enum.reduce(file_range(), [], fn n, files -> files ++ ["#{[n]}"] end)
  end
end

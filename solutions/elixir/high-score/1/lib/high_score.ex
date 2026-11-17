defmodule HighScore do
  def new() do
    %{}
  end

  def add_player(scores, name, score \\ 0) do
    Map.put_new(scores, name, score)
  end

  def remove_player(scores, name) do
    Map.delete(scores, name)
  end

  def reset_score(scores, name) do
    cond do
      Map.has_key?(scores, name) -> Map.replace(scores, name, 0)
      true -> add_player(scores, name)
    end
  end

  def update_score(scores, name, score) do
    Map.put(scores, name, score + Map.get(scores, name, 0))
  end

  def get_players(scores) do
    Map.keys(scores)
  end
end

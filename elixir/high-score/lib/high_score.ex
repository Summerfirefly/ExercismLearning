defmodule HighScore do
  @init_score 0
  def new() do
    %{}
  end

  def add_player(scores, name, score \\ @init_score) do
    Map.put_new(scores, name, score)
  end

  def remove_player(scores, name) do
    Map.delete(scores, name)
  end

  def reset_score(scores, name) do
    cond do
      Map.has_key?(scores, name) -> Map.replace(scores, name, @init_score)
      true -> add_player(scores, name)
    end
  end

  def update_score(scores, name, score) do
    Map.update(scores, name, score, fn old -> old + score end)
  end

  def get_players(scores) do
    Map.keys(scores)
  end
end

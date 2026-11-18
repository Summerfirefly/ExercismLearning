defmodule RPG.CharacterSheet do
  def welcome() do
    IO.puts("Welcome! Let's fill out your character sheet together.")
  end

  def ask_name() do
    IO.gets("What is your character's name?\n")
    |> String.trim
  end

  def ask_class() do
    IO.gets("What is your character's class?\n")
    |> String.trim
  end

  def ask_level() do
    IO.gets("What is your character's level?\n")
    |> String.trim
    |> String.to_integer
  end

  def run() do
    _ = welcome()
    n = ask_name()
    c = ask_class()
    l = ask_level()
    IO.inspect(%{name: n, class: c, level: l}, label: "Your character")
  end
end

defmodule GuessingGame do
  def compare(secret_number, guess \\ :no_guess)
  
  def compare(secret_number, guess) when secret_number == guess do
    "Correct"
  end
  
  def compare(secret_number, guess) when secret_number - guess > 1 do
    "Too low"
  end
  
  def compare(secret_number, guess) when secret_number - guess < -1 do
    "Too high"
  end
  
  def compare(_secret_number, guess) when guess == :no_guess do
    "Make a guess"
  end
  
  def compare(secret_number, guess) when secret_number != guess do
    "So close"
  end
end

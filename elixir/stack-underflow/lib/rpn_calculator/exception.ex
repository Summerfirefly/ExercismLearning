defmodule RPNCalculator.Exception do
  # Please implement DivisionByZeroError here.
  defmodule DivisionByZeroError do
    defexception message: "division by zero occurred"
  end

  # Please implement StackUnderflowError here.
  defmodule StackUnderflowError do
    defexception message: "stack underflow occurred"

    @impl true
    def exception(value) do
      case value do
        [] -> %StackUnderflowError{}
        _ -> %StackUnderflowError{message: "stack underflow occurred, context: #{value}"}
      end
    end
  end

  def divide(stack) when length(stack) < 2 do
    raise StackUnderflowError, "when dividing"
  end

  def divide([first | [second | _]]) do
    if first == 0 do
      raise DivisionByZeroError
    else
      div(second, first)
    end
  end
end

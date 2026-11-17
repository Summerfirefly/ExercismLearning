defmodule TopSecret do
  def to_ast(string) do
    {:ok, ast} = Code.string_to_quoted(string)
    ast
  end

  def decode_secret_message_part(ast, acc) do
    case ast do
      {op, _, args} when op == :def or op == :defp ->
        {ast, [get_secret_func_name(args) | acc]}
      _ -> {ast, acc}
    end
  end

  def decode_secret_message(string) do
    {_, acc} = string
      |> to_ast()
      |> Macro.prewalk([], &decode_secret_message_part/2)
    acc |> Enum.reverse() |> Enum.join()
  end

  defp get_secret_func_name([func_ast | _]) do
    {func_name, _, param} = func_ast
    if is_list(param) do
      case func_name do
        :when -> get_secret_func_name(param)
        _ -> String.slice(Atom.to_string(func_name), 0, length(param))
      end
    else
      ""
    end
  end
end

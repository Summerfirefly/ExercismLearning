defmodule Username do
  def sanitize(username) do
    username
    |> sanitize([])
  end

  defp sanitize([], result), do: result
  defp sanitize([h | t], result) do
    case h do
      h when (h >= ?a and h <= ?z) or h == ?_ -> sanitize(t, result ++ [h])
      h when h == ?ä -> sanitize(t, result ++ ~c"ae")
      h when h == ?ö -> sanitize(t, result ++ ~c"oe")
      h when h == ?ü -> sanitize(t, result ++ ~c"ue")
      h when h == ?ß -> sanitize(t, result ++ ~c"ss")
      _ -> sanitize(t, result)
    end
  end
end

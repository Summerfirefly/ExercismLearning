defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    do_extract_from_path(data, String.split(path, "."))
  end
  
  defp do_extract_from_path(nil, _path), do: nil
  defp do_extract_from_path(_data, []), do: nil
  defp do_extract_from_path(data, [first | remain]) do
    case remain do
      [] -> data[first]
      _ -> do_extract_from_path(data[first], remain)
    end
  end

  def get_in_path(data, path) do
    get_in(data, String.split(path, "."))
  end
end

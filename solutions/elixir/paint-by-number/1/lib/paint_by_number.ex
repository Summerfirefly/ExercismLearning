defmodule PaintByNumber do
  def palette_bit_size(color_count) do
    calc_bit_size(color_count, 0)
  end

  def empty_picture() do
    <<>>
  end

  def test_picture() do
    <<0::2, 1::2, 2::2, 3::2>>
  end

  def prepend_pixel(picture, color_count, pixel_color_index) do
    <<pixel_color_index::size(palette_bit_size(color_count)), picture::bitstring>>
  end

  def get_first_pixel(<<>>, _), do: nil
  def get_first_pixel(picture, color_count) do
    bit_size = palette_bit_size(color_count)
    <<index::size(^bit_size), _::bitstring>> = picture
    index
  end

  def drop_first_pixel(<<>>, _), do: <<>>
  def drop_first_pixel(picture, color_count) do
    bit_size = palette_bit_size(color_count)
    <<_::size(^bit_size), rest::bitstring>> = picture
    rest
  end

  def concat_pictures(picture1, picture2) do
    <<picture1::bitstring, picture2::bitstring>>
  end

  defp calc_bit_size(color_count, acc) do
    cond do
      color_count <= 2 ** acc -> acc
      true -> calc_bit_size(color_count, acc + 1)
    end
  end
end

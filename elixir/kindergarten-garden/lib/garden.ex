defmodule Garden do
  @plant_map %{"G" => :grass, "C" => :clover, "R" => :radishes, "V" => :violets}
  @default_names [
    :alice,
    :bob,
    :charlie,
    :david,
    :eve,
    :fred,
    :ginny,
    :harriet,
    :ileana,
    :joseph,
    :kincaid,
    :larry
  ]

  @doc """
    Accepts a string representing the arrangement of cups on a windowsill and a
    list with names of students in the class. The student names list does not
    have to be in alphabetical order.

    It decodes that string into the various gardens for each student and returns
    that information in a map.
  """

  @spec info(String.t(), list) :: map
  def info(info_string, student_names \\ @default_names) do
    info_string
    |> String.split("\n", trim: true)
    |> Enum.map(fn line ->
      line
      |> String.graphemes()
      |> Enum.map(&@plant_map[&1])
      |> Enum.chunk_every(2)
    end)
    |> Enum.zip_with(&Enum.concat/1)
    |> Enum.zip_with(Enum.sort(student_names), fn plants, name ->
      {name, List.to_tuple(plants)}
    end)
    |> Enum.into(Map.new(student_names, &{&1, {}}))
  end
end

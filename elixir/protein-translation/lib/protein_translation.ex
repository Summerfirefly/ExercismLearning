defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {:ok, list(String.t())} | {:error, String.t()}
  def of_rna(""), do: {:ok, []}
  
  def of_rna(rna) do
    proteins_result = String.to_charlist(rna)
    |> Enum.chunk_every(3)
    |> Enum.reduce_while([], fn elem, acc ->
         case of_codon(List.to_string(elem)) do
           {:ok, "STOP"} -> {:halt, acc}
           {:ok, protein} -> {:cont, [protein | acc]}
           {:error, _} -> {:halt, "invalid RNA"}
         end
       end)

    if is_list(proteins_result) do
      {:ok, Enum.reverse(proteins_result)}
    else
      {:error, proteins_result}
    end
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def of_codon(codon) do
    case codon do
      code when code in ["UAA", "UAG", "UGA"] -> {:ok, "STOP"}
      code when code in ["UGU", "UGC"] -> {:ok, "Cysteine"}
      code when code in ["UUA", "UUG"] -> {:ok, "Leucine"}
      "AUG" -> {:ok, "Methionine"}
      code when code in ["UUU", "UUC"] -> {:ok, "Phenylalanine"}
      code when code in ["UCU", "UCC", "UCA", "UCG"] -> {:ok, "Serine"}
      "UGG" -> {:ok, "Tryptophan"}
      code when code in ["UAU", "UAC"] -> {:ok, "Tyrosine"}
      _ -> {:error, "invalid codon"}
    end
  end
end

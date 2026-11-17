defmodule BinarySearchTree do
  @type bst_node :: %{data: any, left: bst_node | nil, right: bst_node | nil}

  @doc """
  Create a new Binary Search Tree with root's value as the given 'data'
  """
  @spec new(any) :: bst_node
  def new(data) do
    %{data: data, left: nil, right: nil}
  end

  @doc """
  Creates and inserts a node with its value as 'data' into the tree.
  """
  @spec insert(bst_node, any) :: bst_node
  def insert(tree, data) do
    path = find_insert_path(tree, data, [])
    do_insert(new(data), path)
  end

  @doc """
  Traverses the Binary Search Tree in order and returns a list of each node's data.
  """
  @spec in_order(bst_node) :: [any]
  def in_order(tree) do
    do_in_order(tree, [], [])
  end

  defp do_insert(tree, []), do: tree

  defp do_insert(tree, [head | rest_path]) do
    case head do
      {node, :left} -> do_insert(%{node | left: tree}, rest_path)
      {node, :right} -> do_insert(%{node | right: tree}, rest_path)
    end
  end

  defp find_insert_path(nil, _, path), do: path

  defp find_insert_path(node, data, path) do
    cond do
      node.data < data -> find_insert_path(node.right, data, [{node, :right} | path])
      true -> find_insert_path(node.left, data, [{node, :left} | path])
    end
  end

  defp do_in_order(nil, [], result), do: result |> Enum.reverse()

  defp do_in_order(nil, [head | rest], result), do: do_in_order(head, rest, result)

  defp do_in_order(current, pending, result) do
    if is_map(current) do
      do_in_order(current.left, [current.data | [current.right | pending]], result)
    else
      do_in_order(nil, pending, [current | result])
    end
  end
end

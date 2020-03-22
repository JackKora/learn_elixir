defmodule KeyValue.Bucket do
  use Agent

  @doc """
  Create a new bucket
  """
  def start_link(_opts) do
    Agent.start_link(fn -> %{} end)
  end

  @doc """
  Put the value under the key, overwrite existing value if it exists
  """
  def put(bucket, key, value) do
    Agent.update(bucket, &Map.put(&1, key, value))
  end

  @doc """
  Get the value for the given key, return nil if value doesn't exist
  """
  def get(bucket, key) do
    Agent.get(bucket, &Map.get(&1, key))
  end

  @doc """
  Delete the given key and return it's value
  """
  def delete(bucket, key) do
    Agent.get_and_update(bucket, &Map.pop(&1, key))
  end
end

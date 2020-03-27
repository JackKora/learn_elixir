defmodule KVServer.CommandTest do
  use ExUnit.Case, async: true
  doctest KVServer.Command

  # setup do
  #   registry = start_supervised!(KeyValue.Registry)
  #   %{registry: registry}
  # end

  # test "create bucket", %{registry: registry} do
  #   assert KVServer.Command.run({:create, "bucket"}, registry) == {:ok, "OK\r\n"}
  # end
end

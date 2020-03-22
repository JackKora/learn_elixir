defmodule KeyValue.RegistryTest do
  use ExUnit.Case, async: true

  setup context do
    _ = start_supervised!({KeyValue.Registry, name: context.test})
    %{registry: context.test}
  end

  test "spawns buckets", %{registry: registry} do
    assert KeyValue.Registry.lookup(registry, "shopping") == :error

    KeyValue.Registry.create(registry, "shopping")
    assert {:ok, bucket} = KeyValue.Registry.lookup(registry, "shopping")

    KeyValue.Bucket.put(bucket, "milk", 1)
    assert KeyValue.Bucket.get(bucket, "milk") == 1
  end

  test "removes buckets on exit", %{registry: registry} do
    KeyValue.Registry.create(registry, "shopping")
    {:ok, bucket} = KeyValue.Registry.lookup(registry, "shopping")
    Agent.stop(bucket)
    # Do a call to ensure the registry processed the DOWN message
    _ = KeyValue.Registry.create(registry, "bogus")
    assert KeyValue.Registry.lookup(registry, "shopping") == :error
  end

  test "removes bucket on crash", %{registry: registry} do
    KeyValue.Registry.create(registry, "shopping")
    {:ok, bucket} = KeyValue.Registry.lookup(registry, "shopping")

    # Stop the bucket with non-normal reason
    Agent.stop(bucket, :shutdown)
    # Do a call to ensure the registry processed the DOWN message
    _ = KeyValue.Registry.create(registry, "bogus")
    assert KeyValue.Registry.lookup(registry, "shopping") == :error
  end

  test "bucket can crash at any time", %{registry: registry} do
    KeyValue.Registry.create(registry, "shopping")
    {:ok, bucket} = KeyValue.Registry.lookup(registry, "shopping")

    # Simulate a bucket crash by explicitly and synchronously shutting it down
    Agent.stop(bucket, :shutdown)

    # Now trying to call the dead process causes a :noproc exit
    catch_exit KeyValue.Bucket.put(bucket, "milk", 3)
  end
end

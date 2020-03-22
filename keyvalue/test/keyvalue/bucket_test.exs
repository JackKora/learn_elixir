defmodule KeyValue.BucketTest do
    use ExUnit.Case, async: true

    setup do
        bucket = start_supervised!(KeyValue.Bucket)
        %{bucket: bucket}
    end

    test "stores values by key", %{bucket: bucket} do
        assert KeyValue.Bucket.get(bucket, "milk") == nil

        KeyValue.Bucket.put(bucket, "milk", 3)
        assert KeyValue.Bucket.get(bucket, "milk") == 3
    end

    test "delete by key", %{bucket: bucket} do
        KeyValue.Bucket.put(bucket, "milk", 3)
        assert KeyValue.Bucket.delete(bucket, "milk") == 3
        assert KeyValue.Bucket.get(bucket, "milk") == nil
    end
end

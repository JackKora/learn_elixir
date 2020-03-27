defmodule KeyValue.RouterTest do
  use ExUnit.Case, async: true

  @tag :distributed
  test "route requests across nodes" do
    assert KeyValue.Router.route("hello", Kernel, :node, []) ==
           :"foo@Jenya-MBP"
    assert KeyValue.Router.route("world", Kernel, :node, []) ==
           :"bar@Jenya-MBP"
  end

  test "raises on unknown entries" do
    assert_raise RuntimeError, ~r/could not find entry/, fn ->
      KeyValue.Router.route(<<0>>, Kernel, :node, [])
    end
  end
end

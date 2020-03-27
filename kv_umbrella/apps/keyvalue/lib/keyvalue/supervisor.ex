defmodule KeyValue.Supervisor do
  use Supervisor

  def start_link(opts) do
    Supervisor.start_link(__MODULE__, :ok, opts)
  end

  @impl true
  def init(:ok) do
    children = [
      {KeyValue.Registry, name: KeyValue.Registry},
      {DynamicSupervisor, name: KeyValue.BucketSupervisor, strategy: :one_for_one},
      {Task.Supervisor, name: KeyValue.RouterTasks},
    ]

    Supervisor.init(children, strategy: :one_for_all)
  end
end

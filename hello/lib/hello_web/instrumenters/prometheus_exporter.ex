defmodule Hello.PrometheusExporter do
  @moduledoc """
  This module implements a plug that provides the `/metrics` endpoint
  for Prometheus to scrape.
  """

  use Prometheus.PlugExporter
end

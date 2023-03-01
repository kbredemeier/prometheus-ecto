defmodule TestEctoInstrumenterWithConfig do
  use Prometheus.EctoInstrumenter

  def label_value(:custom_label, _) do
    "custom_label"
  end
end

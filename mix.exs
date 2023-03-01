defmodule PrometheusEcto.Mixfile do
  use Mix.Project

  @source_url "https://github.com/deadtrickster/prometheus-ecto"
  @version "1.4.3"

  def project do
    [
      app: :prometheus_ecto,
      version: @version,
      elixir: "~> 1.13",
      elixirc_paths: elixirc_paths(Mix.env()),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      docs: [
        main: "readme",
        source_ref: "v#{@version}",
        source_url: @source_url,
        extras: ["README.md"]
      ],
      aliases: aliases()
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  def application do
    [applications: [:logger, :prometheus_ex]]
  end

  defp description do
    """
    Prometheus monitoring system client Ecto integration. Observes queries duration.
    """
  end

  defp package do
    [
      maintainers: ["Ilya Khaprov"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => @source_url,
        "Prometheus.erl" => "https://hex.pm/packages/prometheus",
        "Prometheus.ex" => "https://hex.pm/packages/prometheus_ex",
        "Plugs Instrumenter/Exporter" => "https://hex.pm/packages/prometheus_plugs",
        "Phoenix Instrumenter" => "https://hex.pm/packages/prometheus_phoenix",
        "Process info Collector" => "https://hex.pm/packages/prometheus_process_collector"
      }
    ]
  end

  defp deps do
    [
      {:prometheus_ex, "~> 1.1 or ~> 2.0 or ~> 3.0"},
      {:ecto_sql, "~> 3.8", only: :test},
      {:ecto, "~> 3.8", only: :test},
      {:postgrex, ">= 0.0.0", only: :test},
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:earmark, ">= 0.0.0", only: :dev},
      {:credo, "~> 1.6", only: [:dev, :test]}
    ]
  end

  defp aliases do
    [
      "ecto.setup": ["ecto.create --quiet", "ecto.migrate --quiet"],
      "ecto.reset": ["ecto.drop", "ecto.create", "ecto.migrate"],
      "ecto.migrate": "ecto.migrate --migrations-path=\"priv/test_repo/migrations\"",
      test: ["ecto.create --quiet", "ecto.migrate --quiet", "test --no-start"]
    ]
  end
end

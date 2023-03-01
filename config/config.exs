import Config

if config_env() == :test do
  config :prometheus_ecto, ecto_repos: [TestRepo]

  config :prometheus_ecto, TestRepo,
    adapter: Ecto.Adapters.Postgres,
    loggers: [Ecto.LogEntry, TestEctoInstrumenter, TestEctoInstrumenterWithConfig],
    pool: Ecto.Adapters.SQL.Sandbox,
    url:
      "ecto://" <>
        System.get_env(
          "DB_URL",
          "postgres:postgres@localhost:5432/prometheus_ecto_test?pool_size=10"
        )

  config :prometheus,
         TestEctoInstrumenterWithConfig,
         labels: [:custom_label],
         registry: :qwe,
         stages: [:queue, :query],
         counter: true,
         query_duration_buckets: [100, 200],
         duration_unit: :seconds
end

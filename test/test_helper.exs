Application.ensure_all_started(:postgrex)
Application.ensure_all_started(:ecto)
Application.ensure_all_started(:prometheus_ex)

{:ok, _pid} = Supervisor.start_link([TestRepo], strategy: :one_for_one)

ExUnit.start()

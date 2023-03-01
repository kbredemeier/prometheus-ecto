defmodule TestRepo do
  use Ecto.Repo, otp_app: :prometheus_ecto, adapter: Ecto.Adapters.Postgres
end

defmodule TestSchema do
  use Ecto.Schema

  import Ecto.Changeset

  schema "test_schema" do
    field(:test_field, :string)
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, ~w(test_field)a)
    |> validate_required(~w(test_field)a)
  end
end

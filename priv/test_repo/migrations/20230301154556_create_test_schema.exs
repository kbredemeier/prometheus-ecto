defmodule TestRepo.Migrations.CreateTestSchema do
  use Ecto.Migration

  def change do
    create table(:test_schema) do
      add(:test_field, :text)
    end
  end
end

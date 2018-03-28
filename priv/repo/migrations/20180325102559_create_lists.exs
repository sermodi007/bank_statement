defmodule Bankparse.Repo.Migrations.CreateLists do
  use Ecto.Migration

  def change do
    create table(:lists) do
      add :date, :date
      add :place, :string
      add :amount, :float
      add :type, :string

      timestamps()
    end

  end
end

defmodule ChiChan.Repo.Migrations.CreatePhoto do
  use Ecto.Migration

  def change do
    create table(:photos) do
      add :url, :string
      add :comment, :string

      timestamps
    end
  end
end

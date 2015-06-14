defmodule ChiChan.Repo.Migrations.AddSubjectToPhotos do
  use Ecto.Migration

  def change do
    alter table(:photos) do
      add :subject, :string, default: "chinami"
    end
  end
end

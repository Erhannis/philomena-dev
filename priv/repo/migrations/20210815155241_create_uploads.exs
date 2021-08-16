defmodule Philomena.Repo.Migrations.CreateUploads do
  use Ecto.Migration

  def change do
    create table(:uploads) do
      add :name, :string
      add :age, :integer

      timestamps()
    end

  end
end

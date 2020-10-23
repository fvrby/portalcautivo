defmodule Portalcautivo.Repo.Migrations.CreateNas do
  use Ecto.Migration

  def change do
    create table(:nas) do
      add :name, :string
      add :mac, :text
      add :project_id, references(:project)

      timestamps()
    end

  end
end

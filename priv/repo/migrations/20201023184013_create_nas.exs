defmodule Portalcautivo.Repo.Migrations.CreateNas do
  @foreign_key_type :id
  use Ecto.Migration

  def change do
    create table(:nas) do
      add :name, :string
      add :mac, :string
      belongs_to :project_id, Portalcautivo.Project_context.Project 

      timestamps()
    end

  end
end

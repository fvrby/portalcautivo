defmodule Portalcautivo.Repo.Migrations.CreateNas do
  @foreign_key_type :project_id
  use Ecto.Migration

  def change do
    create table(:nas) do
      add :name, :string
      add :mac, :string
      add :project_id, :integer

      timestamps()
    end

  end
end

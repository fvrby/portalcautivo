defmodule Portalcautivo.Repo.Migrations.CreateCaptives do
@foreign_key_type :project_id
  use Ecto.Migration

  def change do
    create table(:captives) do
      add :name, :string
      add :social_network, :boolean, default: false, null: false
      add :version, :integer
      add :project_id, references(:project)

      timestamps()
    end

  end
end

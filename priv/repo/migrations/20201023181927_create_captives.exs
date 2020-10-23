defmodule Portalcautivo.Repo.Migrations.CreateCaptives do
  use Ecto.Migration

  def change do
    create table(:captives) do
      add :name, :string
      add :social_network, :boolean, default: false, null: false
      add :version, :integer
      add :project_id, :integer

      timestamps()
    end

  end
end

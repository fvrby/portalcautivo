defmodule Portalcautivo.Repo.Migrations.CreateProjects do
@foreign_key_type {:client_id, :captive_id, :id}
  use Ecto.Migration

  def change do
    create table(:projects) do
      add :name, :string
      add :client_id, references(:client)
      add :captive_id, references(:captive)

      timestamps()
    end

  end
end

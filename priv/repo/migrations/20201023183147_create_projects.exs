defmodule Portalcautivo.Repo.Migrations.CreateProjects do
@foreign_key_type :id
  use Ecto.Migration

  def change do
    create table(:projects) do
      add :name, :string
      add :client_id, :integer
      add :captive_id, :integer

      timestamps()
    end

  end
end

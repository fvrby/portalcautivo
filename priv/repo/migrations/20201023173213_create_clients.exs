defmodule Portalcautivo.Repo.Migrations.CreateClients do
@foreign_key_type :id
  use Ecto.Migration

  def change do
    create table(:clients) do
      add :name, :string

      timestamps()
    end

  end
end

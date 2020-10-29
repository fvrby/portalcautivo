defmodule Portalcautivo.Repo.Migrations.CreateNascamp do
@foreign_key_type :id
  use Ecto.Migration

  def change do
    create table(:nascamp) do
      add :campaign_id, :integer

      timestamps()
    end

  end
end

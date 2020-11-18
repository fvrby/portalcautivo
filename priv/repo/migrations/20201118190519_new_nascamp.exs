defmodule Portalcautivo.Repo.Migrations.NewNascamp do
  use Ecto.Migration

  def change do
  create table(:nascamp) do
      add :campaign_id, :integer
      add :nas_id, :integer 
      timestamps()
    end
  end
end

defmodule Portalcautivo.Repo.Migrations.CreateNascamp do
  use Ecto.Migration

  def change do
    create table(:nascamp) do
      add :campaign_id, :integer

      timestamps()
    end

  end
end

defmodule Portalcautivo.Repo.Migrations.CreateComponents do
  use Ecto.Migration

  def change do
    create table(:components) do
      add :type, :string
      add :src, :string
      add :meta, :string
      add :campaign_id, :integer

      timestamps()
    end

  end
end

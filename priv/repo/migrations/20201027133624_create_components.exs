defmodule Portalcautivo.Repo.Migrations.CreateComponents do
@foreign_key_type :campaign_id
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

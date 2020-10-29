defmodule Portalcautivo.Repo.Migrations.CreateCampaign do
@foreign_key_type :id
  use Ecto.Migration

  def change do
    create table(:campaign) do
      add :name, :string
      add :start, :naive_datetime
      add :stop, :naive_datetime
      add :limit, :integer
      add :quota, :integer
      add :quota_daily, :integer
      add :counter_global, :integer
      add :counter_daily, :integer

      timestamps()
    end

  end
end

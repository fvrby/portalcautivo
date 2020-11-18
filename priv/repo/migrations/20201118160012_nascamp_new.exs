defmodule Portalcautivo.Repo.Migrations.NascampNew do
  use Ecto.Migration

  def change do
    alter table(:nascamp) do
      remove :nas
    end
  end
end

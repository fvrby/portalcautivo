defmodule Portalcautivo.Repo.Migrations.NascampNewData do
  use Ecto.Migration

  def change do
    alter table(:nascamp) do
      remove :nas
      add :nas_id, :integer
    end

  end
end

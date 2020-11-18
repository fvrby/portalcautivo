defmodule Portalcautivo.Repo.Migrations.NascampNew3 do
  use Ecto.Migration

  def change do
    alter table(:nascamp) do
      add :nas_id, :integer
  end

  end
end

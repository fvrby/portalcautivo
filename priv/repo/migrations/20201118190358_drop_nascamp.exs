defmodule Portalcautivo.Repo.Migrations.DropNascamp do
  use Ecto.Migration

  def change do
    drop table(:nascamp)
  end
end

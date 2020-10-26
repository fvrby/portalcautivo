defmodule Portalcautivo.Repo.Migrations.CrearRelaciones do
  use Ecto.Migration

  def change do
    alter table("captive" ) do
      modify :project_id, references("client")

      timestamps()
    end
  end

  
end

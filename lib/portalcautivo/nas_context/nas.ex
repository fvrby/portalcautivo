defmodule Portalcautivo.Nas_context.Nas do
  use Ecto.Schema
  import Ecto.Changeset

  schema "nas" do
    field :name, :string
    field :mac, :string
    field :project_id, references(:project)

    timestamps()
  end

  @doc false
  def changeset(nas, attrs) do
    nas
    |> cast(attrs, [:name, :mac, :project_id])
    |> validate_required([:name, :mac, :project_id])
  end
end

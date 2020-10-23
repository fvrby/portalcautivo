defmodule Portalcautivo.Project_context.Project do
  use Ecto.Schema
  import Ecto.Changeset

  schema "projects" do
    field :captive_id, references(:captive)
    field :client_id,  references(:client)
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:name, :client_id, :captive_id])
    |> validate_required([:name, :client_id, :captive_id])
  end
end

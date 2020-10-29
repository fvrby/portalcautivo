defmodule Portalcautivo.Project_context.Project do
  use Ecto.Schema
  @foreign_key_type :id
  import Ecto.Changeset

  schema "projects" do
    field :captive_id, Portalcautivo.Captive_Context.Captive
    field :client_id, Portalcautivo.Context.Client
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

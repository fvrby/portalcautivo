defmodule Portalcautivo.Project_context.Project do
  use Ecto.Schema
  @foreign_key_type :id
  import Ecto.Changeset

  schema "projects" do
    belongs_to :captive, Portalcautivo.Captive_Context.Captive
    belongs_to :client, Portalcautivo.Context.Client
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

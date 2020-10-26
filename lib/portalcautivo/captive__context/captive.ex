defmodule Portalcautivo.Captive_Context.Captive do
  use Ecto.Schema
  @foreign_key_type :id
  import Ecto.Changeset

  schema "captives" do
    field :name, :string
    field :project_id, :integer
    field :social_network, :boolean, default: false
    field :version, :integer

    timestamps()
  end

  @doc false
  def changeset(captive, attrs) do
    captive
    |> cast(attrs, [:name, :social_network, :version, :project_id])
    |> validate_required([:name, :social_network, :version, :project_id])
  end
end

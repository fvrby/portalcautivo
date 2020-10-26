defmodule Portalcautivo.Context.Client do
  use Ecto.Schema
  @foreign_key_type :id
  import Ecto.Changeset

  schema "clients" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(client, attrs) do
    client
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end

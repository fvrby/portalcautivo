defmodule Portalcautivo.Components_context.Components do
  use Ecto.Schema
  @foreign_key_type :id
  import Ecto.Changeset

  schema "components" do
    belongs_to :id, Portalcautivo.Campaign_context.Campaign
    field :meta, :string
    field :src, :string
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(components, attrs) do
    components
    |> cast(attrs, [:type, :src, :meta, :campaign_id])
    |> validate_required([:type, :src, :meta, :campaign_id])
  end
end

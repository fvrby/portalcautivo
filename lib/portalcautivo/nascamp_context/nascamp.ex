defmodule Portalcautivo.Nascamp_context.Nascamp do
  use Ecto.Schema
  @foreign_key_type :id
  import Ecto.Changeset

  schema "nascamp" do
    belongs_to :campaign, Portalcautivo.Campaign_context.Campaign
    belongs_to :nas, Portalcautivo.Nas_context.Nas
    timestamps()
  end

  @doc false
  def changeset(nascamp, attrs) do
    nascamp
    |> cast(attrs, [:nas_id,:campaign_id])
    |> validate_required([:nas_id, :campaign_id])
  end
end

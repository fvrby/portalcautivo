defmodule Portalcautivo.Nascamp_context.Nascamp do
  use Ecto.Schema
  @foreign_key_type :id
  import Ecto.Changeset

  schema "nascamp" do
    belongs_to :campaign, Portalcautivo.Campaign_context.Campaign
    timestamps()
  end

  @doc false
  def changeset(nascamp, attrs) do
    nascamp
    |> cast(attrs, [:campaign_id])
    |> validate_required([:campaign_id])
  end
end

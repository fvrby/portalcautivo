defmodule Portalcautivo.Campaign_context.Campaign do
  use Ecto.Schema
  @foreign_key_type :id
  import Ecto.Changeset

  schema "campaign" do
    field :counter_daily, :integer
    field :counter_global, :integer
    field :limit, :integer
    field :name, :string
    field :quota, :integer
    field :quota_daily, :integer
    field :start, :naive_datetime
    field :stop, :naive_datetime

    timestamps()
  end

  @doc false
  def changeset(campaign, attrs) do
    campaign
    |> cast(attrs, [:name, :start, :stop, :limit, :quota, :quota_daily, :counter_global, :counter_daily])
    |> validate_required([:name, :start, :stop, :limit, :quota, :quota_daily, :counter_global, :counter_daily])
  end
end

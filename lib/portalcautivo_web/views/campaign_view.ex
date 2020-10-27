defmodule PortalcautivoWeb.CampaignView do
  use PortalcautivoWeb, :view
  alias PortalcautivoWeb.CampaignView

  def render("index.json", %{campaign: campaign}) do
    %{data: render_many(campaign, CampaignView, "campaign.json")}
  end

  def render("show.json", %{campaign: campaign}) do
    %{data: render_one(campaign, CampaignView, "campaign.json")}
  end

  def render("campaign.json", %{campaign: campaign}) do
    %{id: campaign.id,
      name: campaign.name,
      start: campaign.start,
      stop: campaign.stop,
      limit: campaign.limit,
      quota: campaign.quota,
      quota_daily: campaign.quota_daily,
      counter_global: campaign.counter_global,
      counter_daily: campaign.counter_daily}
  end
end

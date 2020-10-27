defmodule PortalcautivoWeb.CampaignController do
  use PortalcautivoWeb, :controller

  alias Portalcautivo.Campaign_context
  alias Portalcautivo.Campaign_context.Campaign

  action_fallback PortalcautivoWeb.FallbackController

  def index(conn, _params) do
    campaign = Campaign_context.list_campaign()
    render(conn, "index.json", campaign: campaign)
  end

  def create(conn, %{"campaign" => campaign_params}) do
    with {:ok, %Campaign{} = campaign} <- Campaign_context.create_campaign(campaign_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.campaign_path(conn, :show, campaign))
      |> render("show.json", campaign: campaign)
    end
  end

  def show(conn, %{"id" => id}) do
    campaign = Campaign_context.get_campaign!(id)
    render(conn, "show.json", campaign: campaign)
  end

  def update(conn, %{"id" => id, "campaign" => campaign_params}) do
    campaign = Campaign_context.get_campaign!(id)

    with {:ok, %Campaign{} = campaign} <- Campaign_context.update_campaign(campaign, campaign_params) do
      render(conn, "show.json", campaign: campaign)
    end
  end

  def delete(conn, %{"id" => id}) do
    campaign = Campaign_context.get_campaign!(id)

    with {:ok, %Campaign{}} <- Campaign_context.delete_campaign(campaign) do
      send_resp(conn, :no_content, "")
    end
  end
end

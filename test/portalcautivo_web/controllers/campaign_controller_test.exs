defmodule PortalcautivoWeb.CampaignControllerTest do
  use PortalcautivoWeb.ConnCase

  alias Portalcautivo.Campaign_context
  alias Portalcautivo.Campaign_context.Campaign

  @create_attrs %{
    counter_daily: 42,
    counter_global: 42,
    limit: 42,
    name: "some name",
    quota: 42,
    quota_daily: 42,
    start: ~N[2010-04-17 14:00:00],
    stop: ~N[2010-04-17 14:00:00]
  }
  @update_attrs %{
    counter_daily: 43,
    counter_global: 43,
    limit: 43,
    name: "some updated name",
    quota: 43,
    quota_daily: 43,
    start: ~N[2011-05-18 15:01:01],
    stop: ~N[2011-05-18 15:01:01]
  }
  @invalid_attrs %{counter_daily: nil, counter_global: nil, limit: nil, name: nil, quota: nil, quota_daily: nil, start: nil, stop: nil}

  def fixture(:campaign) do
    {:ok, campaign} = Campaign_context.create_campaign(@create_attrs)
    campaign
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all campaign", %{conn: conn} do
      conn = get(conn, Routes.campaign_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create campaign" do
    test "renders campaign when data is valid", %{conn: conn} do
      conn = post(conn, Routes.campaign_path(conn, :create), campaign: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.campaign_path(conn, :show, id))

      assert %{
               "id" => id,
               "counter_daily" => 42,
               "counter_global" => 42,
               "limit" => 42,
               "name" => "some name",
               "quota" => 42,
               "quota_daily" => 42,
               "start" => "2010-04-17T14:00:00",
               "stop" => "2010-04-17T14:00:00"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.campaign_path(conn, :create), campaign: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update campaign" do
    setup [:create_campaign]

    test "renders campaign when data is valid", %{conn: conn, campaign: %Campaign{id: id} = campaign} do
      conn = put(conn, Routes.campaign_path(conn, :update, campaign), campaign: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.campaign_path(conn, :show, id))

      assert %{
               "id" => id,
               "counter_daily" => 43,
               "counter_global" => 43,
               "limit" => 43,
               "name" => "some updated name",
               "quota" => 43,
               "quota_daily" => 43,
               "start" => "2011-05-18T15:01:01",
               "stop" => "2011-05-18T15:01:01"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, campaign: campaign} do
      conn = put(conn, Routes.campaign_path(conn, :update, campaign), campaign: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete campaign" do
    setup [:create_campaign]

    test "deletes chosen campaign", %{conn: conn, campaign: campaign} do
      conn = delete(conn, Routes.campaign_path(conn, :delete, campaign))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.campaign_path(conn, :show, campaign))
      end
    end
  end

  defp create_campaign(_) do
    campaign = fixture(:campaign)
    %{campaign: campaign}
  end
end

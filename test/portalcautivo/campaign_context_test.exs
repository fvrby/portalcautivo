defmodule Portalcautivo.Campaign_contextTest do
  use Portalcautivo.DataCase

  alias Portalcautivo.Campaign_context

  describe "campaign" do
    alias Portalcautivo.Campaign_context.Campaign

    @valid_attrs %{counter_daily: 42, counter_global: 42, limit: 42, name: "some name", quota: 42, quota_daily: 42, start: ~N[2010-04-17 14:00:00], stop: ~N[2010-04-17 14:00:00]}
    @update_attrs %{counter_daily: 43, counter_global: 43, limit: 43, name: "some updated name", quota: 43, quota_daily: 43, start: ~N[2011-05-18 15:01:01], stop: ~N[2011-05-18 15:01:01]}
    @invalid_attrs %{counter_daily: nil, counter_global: nil, limit: nil, name: nil, quota: nil, quota_daily: nil, start: nil, stop: nil}

    def campaign_fixture(attrs \\ %{}) do
      {:ok, campaign} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Campaign_context.create_campaign()

      campaign
    end

    test "list_campaign/0 returns all campaign" do
      campaign = campaign_fixture()
      assert Campaign_context.list_campaign() == [campaign]
    end

    test "get_campaign!/1 returns the campaign with given id" do
      campaign = campaign_fixture()
      assert Campaign_context.get_campaign!(campaign.id) == campaign
    end

    test "create_campaign/1 with valid data creates a campaign" do
      assert {:ok, %Campaign{} = campaign} = Campaign_context.create_campaign(@valid_attrs)
      assert campaign.counter_daily == 42
      assert campaign.counter_global == 42
      assert campaign.limit == 42
      assert campaign.name == "some name"
      assert campaign.quota == 42
      assert campaign.quota_daily == 42
      assert campaign.start == ~N[2010-04-17 14:00:00]
      assert campaign.stop == ~N[2010-04-17 14:00:00]
    end

    test "create_campaign/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Campaign_context.create_campaign(@invalid_attrs)
    end

    test "update_campaign/2 with valid data updates the campaign" do
      campaign = campaign_fixture()
      assert {:ok, %Campaign{} = campaign} = Campaign_context.update_campaign(campaign, @update_attrs)
      assert campaign.counter_daily == 43
      assert campaign.counter_global == 43
      assert campaign.limit == 43
      assert campaign.name == "some updated name"
      assert campaign.quota == 43
      assert campaign.quota_daily == 43
      assert campaign.start == ~N[2011-05-18 15:01:01]
      assert campaign.stop == ~N[2011-05-18 15:01:01]
    end

    test "update_campaign/2 with invalid data returns error changeset" do
      campaign = campaign_fixture()
      assert {:error, %Ecto.Changeset{}} = Campaign_context.update_campaign(campaign, @invalid_attrs)
      assert campaign == Campaign_context.get_campaign!(campaign.id)
    end

    test "delete_campaign/1 deletes the campaign" do
      campaign = campaign_fixture()
      assert {:ok, %Campaign{}} = Campaign_context.delete_campaign(campaign)
      assert_raise Ecto.NoResultsError, fn -> Campaign_context.get_campaign!(campaign.id) end
    end

    test "change_campaign/1 returns a campaign changeset" do
      campaign = campaign_fixture()
      assert %Ecto.Changeset{} = Campaign_context.change_campaign(campaign)
    end
  end
end

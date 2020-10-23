defmodule Portalcautivo.Captive_ContextTest do
  use Portalcautivo.DataCase

  alias Portalcautivo.Captive_Context

  describe "captives" do
    alias Portalcautivo.Captive_Context.Captive

    @valid_attrs %{name: "some name", project_id: 42, social_network: true, version: 42}
    @update_attrs %{name: "some updated name", project_id: 43, social_network: false, version: 43}
    @invalid_attrs %{name: nil, project_id: nil, social_network: nil, version: nil}

    def captive_fixture(attrs \\ %{}) do
      {:ok, captive} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Captive_Context.create_captive()

      captive
    end

    test "list_captives/0 returns all captives" do
      captive = captive_fixture()
      assert Captive_Context.list_captives() == [captive]
    end

    test "get_captive!/1 returns the captive with given id" do
      captive = captive_fixture()
      assert Captive_Context.get_captive!(captive.id) == captive
    end

    test "create_captive/1 with valid data creates a captive" do
      assert {:ok, %Captive{} = captive} = Captive_Context.create_captive(@valid_attrs)
      assert captive.name == "some name"
      assert captive.project_id == 42
      assert captive.social_network == true
      assert captive.version == 42
    end

    test "create_captive/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Captive_Context.create_captive(@invalid_attrs)
    end

    test "update_captive/2 with valid data updates the captive" do
      captive = captive_fixture()
      assert {:ok, %Captive{} = captive} = Captive_Context.update_captive(captive, @update_attrs)
      assert captive.name == "some updated name"
      assert captive.project_id == 43
      assert captive.social_network == false
      assert captive.version == 43
    end

    test "update_captive/2 with invalid data returns error changeset" do
      captive = captive_fixture()
      assert {:error, %Ecto.Changeset{}} = Captive_Context.update_captive(captive, @invalid_attrs)
      assert captive == Captive_Context.get_captive!(captive.id)
    end

    test "delete_captive/1 deletes the captive" do
      captive = captive_fixture()
      assert {:ok, %Captive{}} = Captive_Context.delete_captive(captive)
      assert_raise Ecto.NoResultsError, fn -> Captive_Context.get_captive!(captive.id) end
    end

    test "change_captive/1 returns a captive changeset" do
      captive = captive_fixture()
      assert %Ecto.Changeset{} = Captive_Context.change_captive(captive)
    end
  end
end

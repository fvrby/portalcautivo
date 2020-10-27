defmodule Portalcautivo.Nascamp_contextTest do
  use Portalcautivo.DataCase

  alias Portalcautivo.Nascamp_context

  describe "nascamp" do
    alias Portalcautivo.Nascamp_context.Nascamp

    @valid_attrs %{campaign_id: 42}
    @update_attrs %{campaign_id: 43}
    @invalid_attrs %{campaign_id: nil}

    def nascamp_fixture(attrs \\ %{}) do
      {:ok, nascamp} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Nascamp_context.create_nascamp()

      nascamp
    end

    test "list_nascamp/0 returns all nascamp" do
      nascamp = nascamp_fixture()
      assert Nascamp_context.list_nascamp() == [nascamp]
    end

    test "get_nascamp!/1 returns the nascamp with given id" do
      nascamp = nascamp_fixture()
      assert Nascamp_context.get_nascamp!(nascamp.id) == nascamp
    end

    test "create_nascamp/1 with valid data creates a nascamp" do
      assert {:ok, %Nascamp{} = nascamp} = Nascamp_context.create_nascamp(@valid_attrs)
      assert nascamp.campaign_id == 42
    end

    test "create_nascamp/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Nascamp_context.create_nascamp(@invalid_attrs)
    end

    test "update_nascamp/2 with valid data updates the nascamp" do
      nascamp = nascamp_fixture()
      assert {:ok, %Nascamp{} = nascamp} = Nascamp_context.update_nascamp(nascamp, @update_attrs)
      assert nascamp.campaign_id == 43
    end

    test "update_nascamp/2 with invalid data returns error changeset" do
      nascamp = nascamp_fixture()
      assert {:error, %Ecto.Changeset{}} = Nascamp_context.update_nascamp(nascamp, @invalid_attrs)
      assert nascamp == Nascamp_context.get_nascamp!(nascamp.id)
    end

    test "delete_nascamp/1 deletes the nascamp" do
      nascamp = nascamp_fixture()
      assert {:ok, %Nascamp{}} = Nascamp_context.delete_nascamp(nascamp)
      assert_raise Ecto.NoResultsError, fn -> Nascamp_context.get_nascamp!(nascamp.id) end
    end

    test "change_nascamp/1 returns a nascamp changeset" do
      nascamp = nascamp_fixture()
      assert %Ecto.Changeset{} = Nascamp_context.change_nascamp(nascamp)
    end
  end
end

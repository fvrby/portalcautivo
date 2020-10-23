defmodule Portalcautivo.Nas_contextTest do
  use Portalcautivo.DataCase

  alias Portalcautivo.Nas_context

  describe "nas" do
    alias Portalcautivo.Nas_context.Nas

    @valid_attrs %{mac: "some mac", name: "some name", project_id: 42}
    @update_attrs %{mac: "some updated mac", name: "some updated name", project_id: 43}
    @invalid_attrs %{mac: nil, name: nil, project_id: nil}

    def nas_fixture(attrs \\ %{}) do
      {:ok, nas} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Nas_context.create_nas()

      nas
    end

    test "list_nas/0 returns all nas" do
      nas = nas_fixture()
      assert Nas_context.list_nas() == [nas]
    end

    test "get_nas!/1 returns the nas with given id" do
      nas = nas_fixture()
      assert Nas_context.get_nas!(nas.id) == nas
    end

    test "create_nas/1 with valid data creates a nas" do
      assert {:ok, %Nas{} = nas} = Nas_context.create_nas(@valid_attrs)
      assert nas.mac == "some mac"
      assert nas.name == "some name"
      assert nas.project_id == 42
    end

    test "create_nas/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Nas_context.create_nas(@invalid_attrs)
    end

    test "update_nas/2 with valid data updates the nas" do
      nas = nas_fixture()
      assert {:ok, %Nas{} = nas} = Nas_context.update_nas(nas, @update_attrs)
      assert nas.mac == "some updated mac"
      assert nas.name == "some updated name"
      assert nas.project_id == 43
    end

    test "update_nas/2 with invalid data returns error changeset" do
      nas = nas_fixture()
      assert {:error, %Ecto.Changeset{}} = Nas_context.update_nas(nas, @invalid_attrs)
      assert nas == Nas_context.get_nas!(nas.id)
    end

    test "delete_nas/1 deletes the nas" do
      nas = nas_fixture()
      assert {:ok, %Nas{}} = Nas_context.delete_nas(nas)
      assert_raise Ecto.NoResultsError, fn -> Nas_context.get_nas!(nas.id) end
    end

    test "change_nas/1 returns a nas changeset" do
      nas = nas_fixture()
      assert %Ecto.Changeset{} = Nas_context.change_nas(nas)
    end
  end
end

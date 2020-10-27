defmodule Portalcautivo.Components_contextTest do
  use Portalcautivo.DataCase

  alias Portalcautivo.Components_context

  describe "components" do
    alias Portalcautivo.Components_context.Components

    @valid_attrs %{campaign_id: 42, meta: "some meta", src: "some src", type: "some type"}
    @update_attrs %{campaign_id: 43, meta: "some updated meta", src: "some updated src", type: "some updated type"}
    @invalid_attrs %{campaign_id: nil, meta: nil, src: nil, type: nil}

    def components_fixture(attrs \\ %{}) do
      {:ok, components} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Components_context.create_components()

      components
    end

    test "list_components/0 returns all components" do
      components = components_fixture()
      assert Components_context.list_components() == [components]
    end

    test "get_components!/1 returns the components with given id" do
      components = components_fixture()
      assert Components_context.get_components!(components.id) == components
    end

    test "create_components/1 with valid data creates a components" do
      assert {:ok, %Components{} = components} = Components_context.create_components(@valid_attrs)
      assert components.campaign_id == 42
      assert components.meta == "some meta"
      assert components.src == "some src"
      assert components.type == "some type"
    end

    test "create_components/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Components_context.create_components(@invalid_attrs)
    end

    test "update_components/2 with valid data updates the components" do
      components = components_fixture()
      assert {:ok, %Components{} = components} = Components_context.update_components(components, @update_attrs)
      assert components.campaign_id == 43
      assert components.meta == "some updated meta"
      assert components.src == "some updated src"
      assert components.type == "some updated type"
    end

    test "update_components/2 with invalid data returns error changeset" do
      components = components_fixture()
      assert {:error, %Ecto.Changeset{}} = Components_context.update_components(components, @invalid_attrs)
      assert components == Components_context.get_components!(components.id)
    end

    test "delete_components/1 deletes the components" do
      components = components_fixture()
      assert {:ok, %Components{}} = Components_context.delete_components(components)
      assert_raise Ecto.NoResultsError, fn -> Components_context.get_components!(components.id) end
    end

    test "change_components/1 returns a components changeset" do
      components = components_fixture()
      assert %Ecto.Changeset{} = Components_context.change_components(components)
    end
  end
end

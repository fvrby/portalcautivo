defmodule PortalcautivoWeb.ComponentsControllerTest do
  use PortalcautivoWeb.ConnCase

  alias Portalcautivo.Components_context
  alias Portalcautivo.Components_context.Components

  @create_attrs %{
    campaign_id: 42,
    meta: "some meta",
    src: "some src",
    type: "some type"
  }
  @update_attrs %{
    campaign_id: 43,
    meta: "some updated meta",
    src: "some updated src",
    type: "some updated type"
  }
  @invalid_attrs %{campaign_id: nil, meta: nil, src: nil, type: nil}

  def fixture(:components) do
    {:ok, components} = Components_context.create_components(@create_attrs)
    components
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all components", %{conn: conn} do
      conn = get(conn, Routes.components_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create components" do
    test "renders components when data is valid", %{conn: conn} do
      conn = post(conn, Routes.components_path(conn, :create), components: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.components_path(conn, :show, id))

      assert %{
               "id" => id,
               "campaign_id" => 42,
               "meta" => "some meta",
               "src" => "some src",
               "type" => "some type"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.components_path(conn, :create), components: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update components" do
    setup [:create_components]

    test "renders components when data is valid", %{conn: conn, components: %Components{id: id} = components} do
      conn = put(conn, Routes.components_path(conn, :update, components), components: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.components_path(conn, :show, id))

      assert %{
               "id" => id,
               "campaign_id" => 43,
               "meta" => "some updated meta",
               "src" => "some updated src",
               "type" => "some updated type"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, components: components} do
      conn = put(conn, Routes.components_path(conn, :update, components), components: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete components" do
    setup [:create_components]

    test "deletes chosen components", %{conn: conn, components: components} do
      conn = delete(conn, Routes.components_path(conn, :delete, components))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.components_path(conn, :show, components))
      end
    end
  end

  defp create_components(_) do
    components = fixture(:components)
    %{components: components}
  end
end

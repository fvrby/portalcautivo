defmodule PortalcautivoWeb.NasControllerTest do
  use PortalcautivoWeb.ConnCase

  alias Portalcautivo.Nas_context
  alias Portalcautivo.Nas_context.Nas

  @create_attrs %{
    mac: "some mac",
    name: "some name",
    project_id: 42
  }
  @update_attrs %{
    mac: "some updated mac",
    name: "some updated name",
    project_id: 43
  }
  @invalid_attrs %{mac: nil, name: nil, project_id: nil}

  def fixture(:nas) do
    {:ok, nas} = Nas_context.create_nas(@create_attrs)
    nas
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all nas", %{conn: conn} do
      conn = get(conn, Routes.nas_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create nas" do
    test "renders nas when data is valid", %{conn: conn} do
      conn = post(conn, Routes.nas_path(conn, :create), nas: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.nas_path(conn, :show, id))

      assert %{
               "id" => id,
               "mac" => "some mac",
               "name" => "some name",
               "project_id" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.nas_path(conn, :create), nas: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update nas" do
    setup [:create_nas]

    test "renders nas when data is valid", %{conn: conn, nas: %Nas{id: id} = nas} do
      conn = put(conn, Routes.nas_path(conn, :update, nas), nas: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.nas_path(conn, :show, id))

      assert %{
               "id" => id,
               "mac" => "some updated mac",
               "name" => "some updated name",
               "project_id" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, nas: nas} do
      conn = put(conn, Routes.nas_path(conn, :update, nas), nas: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete nas" do
    setup [:create_nas]

    test "deletes chosen nas", %{conn: conn, nas: nas} do
      conn = delete(conn, Routes.nas_path(conn, :delete, nas))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.nas_path(conn, :show, nas))
      end
    end
  end

  defp create_nas(_) do
    nas = fixture(:nas)
    %{nas: nas}
  end
end

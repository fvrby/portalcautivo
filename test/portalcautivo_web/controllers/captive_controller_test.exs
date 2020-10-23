defmodule PortalcautivoWeb.CaptiveControllerTest do
  use PortalcautivoWeb.ConnCase

  alias Portalcautivo.Captive_Context
  alias Portalcautivo.Captive_Context.Captive

  @create_attrs %{
    name: "some name",
    project_id: 42,
    social_network: true,
    version: 42
  }
  @update_attrs %{
    name: "some updated name",
    project_id: 43,
    social_network: false,
    version: 43
  }
  @invalid_attrs %{name: nil, project_id: nil, social_network: nil, version: nil}

  def fixture(:captive) do
    {:ok, captive} = Captive_Context.create_captive(@create_attrs)
    captive
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all captives", %{conn: conn} do
      conn = get(conn, Routes.captive_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create captive" do
    test "renders captive when data is valid", %{conn: conn} do
      conn = post(conn, Routes.captive_path(conn, :create), captive: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.captive_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some name",
               "project_id" => 42,
               "social_network" => true,
               "version" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.captive_path(conn, :create), captive: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update captive" do
    setup [:create_captive]

    test "renders captive when data is valid", %{conn: conn, captive: %Captive{id: id} = captive} do
      conn = put(conn, Routes.captive_path(conn, :update, captive), captive: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.captive_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some updated name",
               "project_id" => 43,
               "social_network" => false,
               "version" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, captive: captive} do
      conn = put(conn, Routes.captive_path(conn, :update, captive), captive: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete captive" do
    setup [:create_captive]

    test "deletes chosen captive", %{conn: conn, captive: captive} do
      conn = delete(conn, Routes.captive_path(conn, :delete, captive))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.captive_path(conn, :show, captive))
      end
    end
  end

  defp create_captive(_) do
    captive = fixture(:captive)
    %{captive: captive}
  end
end

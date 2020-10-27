defmodule PortalcautivoWeb.NascampControllerTest do
  use PortalcautivoWeb.ConnCase

  alias Portalcautivo.Nascamp_context
  alias Portalcautivo.Nascamp_context.Nascamp

  @create_attrs %{
    campaign_id: 42
  }
  @update_attrs %{
    campaign_id: 43
  }
  @invalid_attrs %{campaign_id: nil}

  def fixture(:nascamp) do
    {:ok, nascamp} = Nascamp_context.create_nascamp(@create_attrs)
    nascamp
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all nascamp", %{conn: conn} do
      conn = get(conn, Routes.nascamp_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create nascamp" do
    test "renders nascamp when data is valid", %{conn: conn} do
      conn = post(conn, Routes.nascamp_path(conn, :create), nascamp: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.nascamp_path(conn, :show, id))

      assert %{
               "id" => id,
               "campaign_id" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.nascamp_path(conn, :create), nascamp: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update nascamp" do
    setup [:create_nascamp]

    test "renders nascamp when data is valid", %{conn: conn, nascamp: %Nascamp{id: id} = nascamp} do
      conn = put(conn, Routes.nascamp_path(conn, :update, nascamp), nascamp: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.nascamp_path(conn, :show, id))

      assert %{
               "id" => id,
               "campaign_id" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, nascamp: nascamp} do
      conn = put(conn, Routes.nascamp_path(conn, :update, nascamp), nascamp: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete nascamp" do
    setup [:create_nascamp]

    test "deletes chosen nascamp", %{conn: conn, nascamp: nascamp} do
      conn = delete(conn, Routes.nascamp_path(conn, :delete, nascamp))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.nascamp_path(conn, :show, nascamp))
      end
    end
  end

  defp create_nascamp(_) do
    nascamp = fixture(:nascamp)
    %{nascamp: nascamp}
  end
end

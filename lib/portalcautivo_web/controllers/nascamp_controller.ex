defmodule PortalcautivoWeb.NascampController do
  use PortalcautivoWeb, :controller

  alias Portalcautivo.Nascamp_context
  alias Portalcautivo.Nascamp_context.Nascamp

  action_fallback PortalcautivoWeb.FallbackController

  def index(conn, _params) do
    nascamp = Nascamp_context.list_nascamp()
    render(conn, "index.json", nascamp: nascamp)
  end

  def create(conn, %{"nascamp" => nascamp_params}) do
    with {:ok, %Nascamp{} = nascamp} <- Nascamp_context.create_nascamp(nascamp_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.nascamp_path(conn, :show, nascamp))
      |> render("show.json", nascamp: nascamp)
    end
  end

  def show(conn, %{"id" => id}) do
    nascamp = Nascamp_context.get_nascamp!(id)
    render(conn, "show.json", nascamp: nascamp)
  end

  def update(conn, %{"id" => id, "nascamp" => nascamp_params}) do
    nascamp = Nascamp_context.get_nascamp!(id)

    with {:ok, %Nascamp{} = nascamp} <- Nascamp_context.update_nascamp(nascamp, nascamp_params) do
      render(conn, "show.json", nascamp: nascamp)
    end
  end

  def delete(conn, %{"id" => id}) do
    nascamp = Nascamp_context.get_nascamp!(id)

    with {:ok, %Nascamp{}} <- Nascamp_context.delete_nascamp(nascamp) do
      send_resp(conn, :no_content, "")
    end
  end
end

defmodule PortalcautivoWeb.NasController do
  use PortalcautivoWeb, :controller

  alias Portalcautivo.Nas_context
  alias Portalcautivo.Nas_context.Nas

  action_fallback PortalcautivoWeb.FallbackController

  def index(conn, _params) do
    nas = Nas_context.list_nas()
    render(conn, "index.json", nas: nas)
  end

  def create(conn, %{"nas" => nas_params}) do
    with {:ok, %Nas{} = nas} <- Nas_context.create_nas(nas_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.nas_path(conn, :show, nas))
      |> render("show.json", nas: nas)
    end
  end

  def show(conn, %{"id" => id}) do
    nas = Nas_context.get_nas!(id)
    render(conn, "show.json", nas: nas)
  end

  def update(conn, %{"id" => id, "nas" => nas_params}) do
    nas = Nas_context.get_nas!(id)

    with {:ok, %Nas{} = nas} <- Nas_context.update_nas(nas, nas_params) do
      render(conn, "show.json", nas: nas)
    end
  end

  def delete(conn, %{"id" => id}) do
    nas = Nas_context.get_nas!(id)

    with {:ok, %Nas{}} <- Nas_context.delete_nas(nas) do
      send_resp(conn, :no_content, "")
    end
  end
end

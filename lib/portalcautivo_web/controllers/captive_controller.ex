defmodule PortalcautivoWeb.CaptiveController do
  use PortalcautivoWeb, :controller

  alias Portalcautivo.Captive_Context
  alias Portalcautivo.Captive_Context.Captive

  action_fallback PortalcautivoWeb.FallbackController

  def index(conn, _params) do
    captives = Captive_Context.list_captives()
    render(conn, "index.json", captives: captives)
  end

  def create(conn, %{"captive" => captive_params}) do
    with {:ok, %Captive{} = captive} <- Captive_Context.create_captive(captive_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.captive_path(conn, :show, captive))
      |> render("show.json", captive: captive)
    end
  end

  def show(conn, %{"id" => id}) do
    captive = Captive_Context.get_captive!(id)
    render(conn, "show.json", captive: captive)
  end

  def update(conn, %{"id" => id, "captive" => captive_params}) do
    captive = Captive_Context.get_captive!(id)

    with {:ok, %Captive{} = captive} <- Captive_Context.update_captive(captive, captive_params) do
      render(conn, "show.json", captive: captive)
    end
  end

  def delete(conn, %{"id" => id}) do
    captive = Captive_Context.get_captive!(id)

    with {:ok, %Captive{}} <- Captive_Context.delete_captive(captive) do
      send_resp(conn, :no_content, "")
    end
  end
end

defmodule PortalcautivoWeb.ComponentsController do
  use PortalcautivoWeb, :controller

  alias Portalcautivo.Components_context
  alias Portalcautivo.Components_context.Components

  action_fallback PortalcautivoWeb.FallbackController

  def index(conn, _params) do
    components = Components_context.list_components()
    render(conn, "index.json", components: components)
  end

  def create(conn, %{"components" => components_params}) do
    with {:ok, %Components{} = components} <- Components_context.create_components(components_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.components_path(conn, :show, components))
      |> render("show.json", components: components)
    end
  end

  def show(conn, %{"id" => id}) do
    components = Components_context.get_components!(id)
    render(conn, "show.json", components: components)
  end

  def update(conn, %{"id" => id, "components" => components_params}) do
    components = Components_context.get_components!(id)

    with {:ok, %Components{} = components} <- Components_context.update_components(components, components_params) do
      render(conn, "show.json", components: components)
    end
  end

  def delete(conn, %{"id" => id}) do
    components = Components_context.get_components!(id)

    with {:ok, %Components{}} <- Components_context.delete_components(components) do
      send_resp(conn, :no_content, "")
    end
  end
end

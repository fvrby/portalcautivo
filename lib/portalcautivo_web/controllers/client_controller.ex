defmodule PortalcautivoWeb.ClientController do
  use PortalcautivoWeb, :controller

  alias Portalcautivo.Context
  alias Portalcautivo.Context.Client

  action_fallback PortalcautivoWeb.FallbackController

  def index(conn, _params) do
    clients = Context.list_clients()
    render(conn, "index.json", clients: clients)
  end

  def create(conn, %{"data" => client_params}) do
    with {:ok, %Client{} = client} <- Context.create_client(client_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.client_path(conn, :show, client))
      |> render("show.json", client: client)
    end
  end

  def show(conn, %{"id" => id}) do
    client = Context.get_client!(id)
    render(conn, "show.json", client: client)
  end

  def update(conn, %{"id" => id, "client" => client_params}) do
    client = Context.get_client!(id)

    with {:ok, %Client{} = client} <- Context.update_client(client, client_params) do
      render(conn, "show.json", client: client)
    end
  end

  def delete(conn, %{"id" => id}) do
    client = Context.get_client!(id)

    with {:ok, %Client{}} <- Context.delete_client(client) do
      send_resp(conn, :no_content, "")
    end
  end
end

defmodule PortalcautivoWeb.ProjectController do
  use PortalcautivoWeb, :controller

  alias Portalcautivo.Project_context
  alias Portalcautivo.Project_context.Project

  action_fallback PortalcautivoWeb.FallbackController

  def index(conn, _params) do
    projects = Project_context.list_projects()
    render(conn, "index.json", projects: projects)
  end

  def create(conn, %{"project" => project_params}) do
    with {:ok, %Project{} = project} <- Project_context.create_project(project_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.project_path(conn, :show, project))
      |> render("show.json", project: project)
    end
  end

  def show(conn, %{"id" => id}) do
    project = Project_context.get_project!(id)
    render(conn, "show.json", project: project)
  end

  def update(conn, %{"id" => id, "project" => project_params}) do
    project = Project_context.get_project!(id)

    with {:ok, %Project{} = project} <- Project_context.update_project(project, project_params) do
      render(conn, "show.json", project: project)
    end
  end

  def delete(conn, %{"id" => id}) do
    project = Project_context.get_project!(id)

    with {:ok, %Project{}} <- Project_context.delete_project(project) do
      send_resp(conn, :no_content, "")
    end
  end
end

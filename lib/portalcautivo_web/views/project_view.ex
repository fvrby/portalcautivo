defmodule PortalcautivoWeb.ProjectView do
  use PortalcautivoWeb, :view
  alias PortalcautivoWeb.ProjectView

  def render("index.json", %{projects: projects}) do
    %{data: render_many(projects, ProjectView, "project.json")}
  end

  def render("show.json", %{project: project}) do
    %{data: render_one(project, ProjectView, "project.json")}
  end

  def render("project.json", %{project: project}) do
    %{id: project.id,
      name: project.name,
      client_id: project.client_id,
      captive_id: project.captive_id}
  end
end

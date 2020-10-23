defmodule PortalcautivoWeb.NasView do
  use PortalcautivoWeb, :view
  alias PortalcautivoWeb.NasView

  def render("index.json", %{nas: nas}) do
    %{data: render_many(nas, NasView, "nas.json")}
  end

  def render("show.json", %{nas: nas}) do
    %{data: render_one(nas, NasView, "nas.json")}
  end

  def render("nas.json", %{nas: nas}) do
    %{id: nas.id,
      name: nas.name,
      mac: nas.mac,
      project_id: nas.project_id}
  end
end

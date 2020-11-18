defmodule PortalcautivoWeb.NascampView do
  use PortalcautivoWeb, :view
  alias PortalcautivoWeb.NascampView

  def render("index.json", %{nascamp: nascamp}) do
    %{data: render_many(nascamp, NascampView, "nascamp.json")}
  end

  def render("show.json", %{nascamp: nascamp}) do
    %{data: render_one(nascamp, NascampView, "nascamp.json")}
  end

  def render("nascamp.json", %{nascamp: nascamp}) do
    %{id: nascamp.id,
      campaign_id: nascamp.campaign_id
      nas_id: nascamp.nas_id}
  end
end

defmodule PortalcautivoWeb.ComponentsView do
  use PortalcautivoWeb, :view
  alias PortalcautivoWeb.ComponentsView

  def render("index.json", %{components: components}) do
    %{data: render_many(components, ComponentsView, "components.json")}
  end

  def render("show.json", %{components: components}) do
    %{data: render_one(components, ComponentsView, "components.json")}
  end

  def render("components.json", %{components: components}) do
    %{id: components.id,
      type: components.type,
      src: components.src,
      meta: components.meta,
      campaign_id: components.campaign_id}
  end
end

defmodule PortalcautivoWeb.CaptiveView do
  use PortalcautivoWeb, :view
  alias PortalcautivoWeb.CaptiveView

  def render("index.json", %{captives: captives}) do
    %{data: render_many(captives, CaptiveView, "captive.json")}
  end

  def render("show.json", %{captive: captive}) do
    %{data: render_one(captive, CaptiveView, "captive.json")}
  end

  def render("captive.json", %{captive: captive}) do
    %{id: captive.id,
      name: captive.name,
      social_network: captive.social_network,
      version: captive.version,
      project_id: captive.project_id}
  end
end

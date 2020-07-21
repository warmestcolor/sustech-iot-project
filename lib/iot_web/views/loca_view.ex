defmodule IotWeb.LocaView do
  use IotWeb, :view
  alias IotWeb.LocaView

  def render("index.json", %{report_locas: report_locas}) do
    %{data: render_many(report_locas, LocaView, "loca.json")}
  end

  def render("show.json", %{loca: loca}) do
    %{data: render_one(loca, LocaView, "loca.json")}
  end

  def render("loca.json", %{loca: loca}) do
    %{id: loca.id,
      ip_address: loca.ip_address,
      data: loca.data}
  end
end

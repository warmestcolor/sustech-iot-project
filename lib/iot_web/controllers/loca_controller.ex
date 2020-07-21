defmodule IotWeb.LocaController do
  use IotWeb, :controller

  alias Iot.Report
  alias Iot.Report.Loca

  action_fallback IotWeb.FallbackController

  def report(conn, params) do
    data = params |> Map.get("data", "")
    loca_params = %{
      data: data,
      ip_address: "none"
    }
    Report.create_loca(loca_params) |> IO.inspect
    conn |> json(%{message: "服务器正在维护，请稍后再试", url: "https://www.taobao.com"})
  end

  def index(conn, _params) do
    report_locas = Report.list_report_locas()
    render(conn, "index.json", report_locas: report_locas)
  end

  def create(conn, %{"loca" => loca_params}) do
    with {:ok, %Loca{} = loca} <- Report.create_loca(loca_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.loca_path(conn, :show, loca))
      |> render("show.json", loca: loca)
    end
  end

  def show(conn, %{"id" => id}) do
    loca = Report.get_loca!(id)
    render(conn, "show.json", loca: loca)
  end

  def update(conn, %{"id" => id, "loca" => loca_params}) do
    loca = Report.get_loca!(id)

    with {:ok, %Loca{} = loca} <- Report.update_loca(loca, loca_params) do
      render(conn, "show.json", loca: loca)
    end
  end

  def delete(conn, %{"id" => id}) do
    loca = Report.get_loca!(id)

    with {:ok, %Loca{}} <- Report.delete_loca(loca) do
      send_resp(conn, :no_content, "")
    end
  end
end

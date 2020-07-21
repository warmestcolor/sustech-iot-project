defmodule IotWeb.LocaControllerTest do
  use IotWeb.ConnCase

  alias Iot.Report
  alias Iot.Report.Loca

  @create_attrs %{
    data: "some data",
    ip_address: "some ip_address"
  }
  @update_attrs %{
    data: "some updated data",
    ip_address: "some updated ip_address"
  }
  @invalid_attrs %{data: nil, ip_address: nil}

  def fixture(:loca) do
    {:ok, loca} = Report.create_loca(@create_attrs)
    loca
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all report_locas", %{conn: conn} do
      conn = get(conn, Routes.loca_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create loca" do
    test "renders loca when data is valid", %{conn: conn} do
      conn = post(conn, Routes.loca_path(conn, :create), loca: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.loca_path(conn, :show, id))

      assert %{
               "id" => id,
               "data" => "some data",
               "ip_address" => "some ip_address"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.loca_path(conn, :create), loca: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update loca" do
    setup [:create_loca]

    test "renders loca when data is valid", %{conn: conn, loca: %Loca{id: id} = loca} do
      conn = put(conn, Routes.loca_path(conn, :update, loca), loca: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.loca_path(conn, :show, id))

      assert %{
               "id" => id,
               "data" => "some updated data",
               "ip_address" => "some updated ip_address"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, loca: loca} do
      conn = put(conn, Routes.loca_path(conn, :update, loca), loca: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete loca" do
    setup [:create_loca]

    test "deletes chosen loca", %{conn: conn, loca: loca} do
      conn = delete(conn, Routes.loca_path(conn, :delete, loca))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.loca_path(conn, :show, loca))
      end
    end
  end

  defp create_loca(_) do
    loca = fixture(:loca)
    {:ok, loca: loca}
  end
end

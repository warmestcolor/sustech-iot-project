defmodule IotWeb.LocationsControllerTest do
  use IotWeb.ConnCase

  alias Iot.Repo

  @create_attrs %{latitue: "some latitue", longitude: "some longitude", name: "some name"}
  @update_attrs %{latitue: "some updated latitue", longitude: "some updated longitude", name: "some updated name"}
  @invalid_attrs %{latitue: nil, longitude: nil, name: nil}

  def fixture(:locations) do
    {:ok, locations} = Repo.create_locations(@create_attrs)
    locations
  end

  describe "index" do
    test "lists all locations", %{conn: conn} do
      conn = get(conn, Routes.locations_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Locations"
    end
  end

  describe "new locations" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.locations_path(conn, :new))
      assert html_response(conn, 200) =~ "New Locations"
    end
  end

  describe "create locations" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.locations_path(conn, :create), locations: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.locations_path(conn, :show, id)

      conn = get(conn, Routes.locations_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Locations"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.locations_path(conn, :create), locations: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Locations"
    end
  end

  describe "edit locations" do
    setup [:create_locations]

    test "renders form for editing chosen locations", %{conn: conn, locations: locations} do
      conn = get(conn, Routes.locations_path(conn, :edit, locations))
      assert html_response(conn, 200) =~ "Edit Locations"
    end
  end

  describe "update locations" do
    setup [:create_locations]

    test "redirects when data is valid", %{conn: conn, locations: locations} do
      conn = put(conn, Routes.locations_path(conn, :update, locations), locations: @update_attrs)
      assert redirected_to(conn) == Routes.locations_path(conn, :show, locations)

      conn = get(conn, Routes.locations_path(conn, :show, locations))
      assert html_response(conn, 200) =~ "some updated latitue"
    end

    test "renders errors when data is invalid", %{conn: conn, locations: locations} do
      conn = put(conn, Routes.locations_path(conn, :update, locations), locations: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Locations"
    end
  end

  describe "delete locations" do
    setup [:create_locations]

    test "deletes chosen locations", %{conn: conn, locations: locations} do
      conn = delete(conn, Routes.locations_path(conn, :delete, locations))
      assert redirected_to(conn) == Routes.locations_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.locations_path(conn, :show, locations))
      end
    end
  end

  defp create_locations(_) do
    locations = fixture(:locations)
    {:ok, locations: locations}
  end
end

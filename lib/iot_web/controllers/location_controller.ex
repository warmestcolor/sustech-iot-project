defmodule IotWeb.LocationController do
  use IotWeb, :controller

  alias Iot.LocationManager
  alias Iot.LocationManager.Location

  def index(conn, _params) do
    locations = LocationManager.list_locations()
    render(conn, "index.html", locations: locations)
  end

  def new(conn, _params) do
    changeset = LocationManager.change_location(%Location{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"location" => location_params}) do
    case LocationManager.create_location(location_params) do
      {:ok, location} ->
        conn
        |> put_flash(:info, "Location created successfully.")
        |> redirect(to: Routes.location_path(conn, :show, location))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    location = LocationManager.get_location!(id)
    render(conn, "show.html", location: location)
  end

  def show_json(conn, %{"id" => id}) do
    location = LocationManager.get_location!(id)
    conn |> json(%{name: location.name, latitude: location.latitue, longitude: location.longitude})
  end

  def edit(conn, %{"id" => id}) do
    location = LocationManager.get_location!(id)
    changeset = LocationManager.change_location(location)
    render(conn, "edit.html", location: location, changeset: changeset)
  end

  def update(conn, %{"id" => id, "location" => location_params}) do
    location = LocationManager.get_location!(id)

    case LocationManager.update_location(location, location_params) do
      {:ok, location} ->
        conn
        |> put_flash(:info, "Location updated successfully.")
        |> redirect(to: Routes.location_path(conn, :show, location))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", location: location, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    location = LocationManager.get_location!(id)
    {:ok, _location} = LocationManager.delete_location(location)

    conn
    |> put_flash(:info, "Location deleted successfully.")
    |> redirect(to: Routes.location_path(conn, :index))
  end
end

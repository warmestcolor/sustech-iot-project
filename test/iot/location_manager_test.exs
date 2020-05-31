defmodule Iot.LocationManagerTest do
  use Iot.DataCase

  alias Iot.LocationManager

  describe "locations" do
    alias Iot.LocationManager.Location

    @valid_attrs %{latitue: "some latitue", longitude: "some longitude", name: "some name"}
    @update_attrs %{latitue: "some updated latitue", longitude: "some updated longitude", name: "some updated name"}
    @invalid_attrs %{latitue: nil, longitude: nil, name: nil}

    def location_fixture(attrs \\ %{}) do
      {:ok, location} =
        attrs
        |> Enum.into(@valid_attrs)
        |> LocationManager.create_location()

      location
    end

    test "list_locations/0 returns all locations" do
      location = location_fixture()
      assert LocationManager.list_locations() == [location]
    end

    test "get_location!/1 returns the location with given id" do
      location = location_fixture()
      assert LocationManager.get_location!(location.id) == location
    end

    test "create_location/1 with valid data creates a location" do
      assert {:ok, %Location{} = location} = LocationManager.create_location(@valid_attrs)
      assert location.latitue == "some latitue"
      assert location.longitude == "some longitude"
      assert location.name == "some name"
    end

    test "create_location/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = LocationManager.create_location(@invalid_attrs)
    end

    test "update_location/2 with valid data updates the location" do
      location = location_fixture()
      assert {:ok, %Location{} = location} = LocationManager.update_location(location, @update_attrs)
      assert location.latitue == "some updated latitue"
      assert location.longitude == "some updated longitude"
      assert location.name == "some updated name"
    end

    test "update_location/2 with invalid data returns error changeset" do
      location = location_fixture()
      assert {:error, %Ecto.Changeset{}} = LocationManager.update_location(location, @invalid_attrs)
      assert location == LocationManager.get_location!(location.id)
    end

    test "delete_location/1 deletes the location" do
      location = location_fixture()
      assert {:ok, %Location{}} = LocationManager.delete_location(location)
      assert_raise Ecto.NoResultsError, fn -> LocationManager.get_location!(location.id) end
    end

    test "change_location/1 returns a location changeset" do
      location = location_fixture()
      assert %Ecto.Changeset{} = LocationManager.change_location(location)
    end
  end
end

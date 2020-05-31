defmodule Iot.RepoTest do
  use Iot.DataCase

  alias Iot.Repo

  describe "locations" do
    alias Iot.Repo.Locations

    @valid_attrs %{latitue: "some latitue", longitude: "some longitude", name: "some name"}
    @update_attrs %{latitue: "some updated latitue", longitude: "some updated longitude", name: "some updated name"}
    @invalid_attrs %{latitue: nil, longitude: nil, name: nil}

    def locations_fixture(attrs \\ %{}) do
      {:ok, locations} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Repo.create_locations()

      locations
    end

    test "list_locations/0 returns all locations" do
      locations = locations_fixture()
      assert Repo.list_locations() == [locations]
    end

    test "get_locations!/1 returns the locations with given id" do
      locations = locations_fixture()
      assert Repo.get_locations!(locations.id) == locations
    end

    test "create_locations/1 with valid data creates a locations" do
      assert {:ok, %Locations{} = locations} = Repo.create_locations(@valid_attrs)
      assert locations.latitue == "some latitue"
      assert locations.longitude == "some longitude"
      assert locations.name == "some name"
    end

    test "create_locations/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Repo.create_locations(@invalid_attrs)
    end

    test "update_locations/2 with valid data updates the locations" do
      locations = locations_fixture()
      assert {:ok, %Locations{} = locations} = Repo.update_locations(locations, @update_attrs)
      assert locations.latitue == "some updated latitue"
      assert locations.longitude == "some updated longitude"
      assert locations.name == "some updated name"
    end

    test "update_locations/2 with invalid data returns error changeset" do
      locations = locations_fixture()
      assert {:error, %Ecto.Changeset{}} = Repo.update_locations(locations, @invalid_attrs)
      assert locations == Repo.get_locations!(locations.id)
    end

    test "delete_locations/1 deletes the locations" do
      locations = locations_fixture()
      assert {:ok, %Locations{}} = Repo.delete_locations(locations)
      assert_raise Ecto.NoResultsError, fn -> Repo.get_locations!(locations.id) end
    end

    test "change_locations/1 returns a locations changeset" do
      locations = locations_fixture()
      assert %Ecto.Changeset{} = Repo.change_locations(locations)
    end
  end
end

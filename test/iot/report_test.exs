defmodule Iot.ReportTest do
  use Iot.DataCase

  alias Iot.Report

  describe "report_locas" do
    alias Iot.Report.Loca

    @valid_attrs %{data: "some data", ip_address: "some ip_address"}
    @update_attrs %{data: "some updated data", ip_address: "some updated ip_address"}
    @invalid_attrs %{data: nil, ip_address: nil}

    def loca_fixture(attrs \\ %{}) do
      {:ok, loca} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Report.create_loca()

      loca
    end

    test "list_report_locas/0 returns all report_locas" do
      loca = loca_fixture()
      assert Report.list_report_locas() == [loca]
    end

    test "get_loca!/1 returns the loca with given id" do
      loca = loca_fixture()
      assert Report.get_loca!(loca.id) == loca
    end

    test "create_loca/1 with valid data creates a loca" do
      assert {:ok, %Loca{} = loca} = Report.create_loca(@valid_attrs)
      assert loca.data == "some data"
      assert loca.ip_address == "some ip_address"
    end

    test "create_loca/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Report.create_loca(@invalid_attrs)
    end

    test "update_loca/2 with valid data updates the loca" do
      loca = loca_fixture()
      assert {:ok, %Loca{} = loca} = Report.update_loca(loca, @update_attrs)
      assert loca.data == "some updated data"
      assert loca.ip_address == "some updated ip_address"
    end

    test "update_loca/2 with invalid data returns error changeset" do
      loca = loca_fixture()
      assert {:error, %Ecto.Changeset{}} = Report.update_loca(loca, @invalid_attrs)
      assert loca == Report.get_loca!(loca.id)
    end

    test "delete_loca/1 deletes the loca" do
      loca = loca_fixture()
      assert {:ok, %Loca{}} = Report.delete_loca(loca)
      assert_raise Ecto.NoResultsError, fn -> Report.get_loca!(loca.id) end
    end

    test "change_loca/1 returns a loca changeset" do
      loca = loca_fixture()
      assert %Ecto.Changeset{} = Report.change_loca(loca)
    end
  end
end

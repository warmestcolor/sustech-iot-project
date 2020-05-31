defmodule Iot.LocationManager.Location do
  use Ecto.Schema
  import Ecto.Changeset

  schema "locations" do
    field :latitue, :string
    field :longitude, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(location, attrs) do
    location
    |> cast(attrs, [:latitue, :longitude, :name])
    |> validate_required([:latitue, :longitude, :name])
  end
end

defmodule Iot.Repo.Migrations.CreateLocations do
  use Ecto.Migration

  def change do
    create table(:locations) do
      add :latitue, :string
      add :longitude, :string
      add :name, :string

      timestamps()
    end

  end
end

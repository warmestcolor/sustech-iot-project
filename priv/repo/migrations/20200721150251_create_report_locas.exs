defmodule Iot.Repo.Migrations.CreateReportLocas do
  use Ecto.Migration

  def change do
    create table(:report_locas) do
      add :ip_address, :string
      add :data, :string

      timestamps()
    end

  end
end

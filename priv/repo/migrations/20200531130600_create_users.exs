defmodule Iot.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :password, :string
      add :avatar, :string
      add :email, :string
      add :gender, :integer

      timestamps()
    end

  end
end

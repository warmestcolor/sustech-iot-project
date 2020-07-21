defmodule Iot.Report.Loca do
  use Ecto.Schema
  import Ecto.Changeset

  schema "report_locas" do
    field :data, :string
    field :ip_address, :string

    timestamps()
  end

  @doc false
  def changeset(loca, attrs) do
    loca
    |> cast(attrs, [:ip_address, :data])
    |> validate_required([:ip_address, :data])
  end
end

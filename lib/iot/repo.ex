defmodule Iot.Repo do
  use Ecto.Repo,
    otp_app: :iot,
    adapter: Ecto.Adapters.Postgres
end

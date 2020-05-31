defmodule IotWeb.LoginController do
  use IotWeb, :controller

  alias Iot.Accounts

  def login(conn, %{"username" => username, "password" => password}) do
    if user = Accounts.get_user(username, password) do
      conn |> json(%{message: "Login success", code: 1, user_id: user.id})
    else
      conn |> put_status(400) |> json(%{message: "Login fail", code: -1})
    end
  end
end

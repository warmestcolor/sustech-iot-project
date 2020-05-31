defmodule IotWeb.ViewHelper do
  use IotWeb, :router
  @moduledoc """
  """

  import Plug.Conn

  alias Iot.Accounts

  @doc """
  Return the current user context based on the authorization header
  """
  def user(conn) do
    current_user = with {:ok, token} <- get_token(conn) do
      get_current_user(token) # |> IO.inspect
    end
    # |> IO.inspect
  end

  defp get_token(conn) do
    token = fetch_cookies(conn).req_cookies |> Map.get("token")
    # case get_req_header(conn, "authorization") do
    #   ["Bearer " <> token] -> {:ok, token}
    #   # _ -> nil
    #   _ ->
    # end
    {:ok, token}
  end

  defp get_current_user("user_" <> user_id) do
    Accounts.get_user!(user_id)
  end

  defp get_current_user(token) do
    Accounts.get_user!(token)
  end
end

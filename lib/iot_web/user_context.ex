defmodule IotWeb.UserContext do
  use IotWeb, :router
  @moduledoc """
  Context
  用于提供当前登录用户信息 :current_user
  """

  @behaviour Plug

  import Plug.Conn

  alias Iot.Accounts

  def init(opts), do: opts

  def call(conn, _) do
    if current_user = fetch_context_user(conn) do
      # conn |> put_session(:user, current_user)
      conn |> assign(:user, current_user)
    else
      # token 错误或者 user 不存在都返回 401
      conn
      |> put_status(401)
      |> json(%{message: "无权访问", code: -1})
      |> halt()
    end
  end

  @doc """
  Return the current user context based on the authorization header
  """
  def fetch_context_user(conn) do
    current_user = with {:ok, token} <- get_token(conn) do
      get_current_user(token) # |> IO.inspect
    end
    # |> IO.inspect
  end

  defp get_token(conn) do
    token = fetch_cookies(conn).req_cookies |> Map.get("token")
    {:ok, token}
  end

  defp get_current_user(nil), do: get_current_user(-1)
  defp get_current_user(""), do: get_current_user(-1)
  defp get_current_user("user_" <> user_id) do
    Accounts.get_user!(user_id)
  end

  defp get_current_user(token) do
    Accounts.get_user!(token)
  end
end

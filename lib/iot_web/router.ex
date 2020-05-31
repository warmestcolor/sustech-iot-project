defmodule IotWeb.Router do
  use IotWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :require_user do
    plug IotWeb.UserContext # 解析 user token 并将 %User{} 注入到 session
  end

  scope "/", IotWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/users", UserController
  end

  scope "/", IotWeb do
    pipe_through [:browser, :require_user]
    resources "/locations", LocationController
  end

  scope "/", IotWeb do
    post "/login", LoginController, :login
    get "/location/:id", LocationController, :show_json
  end

  # Other scopes may use custom stacks.
  # scope "/api", IotWeb do
  #   pipe_through :api
  # end
end

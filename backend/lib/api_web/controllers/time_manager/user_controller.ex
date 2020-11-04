defmodule ApiWeb.TimeManager.UserController do
  use ApiWeb, :controller

  alias Api.TimeManager
  alias Api.TimeManager.User

  action_fallback ApiWeb.FallbackController

  def index(conn, params) when params == %{} do
    users = TimeManager.list_users()
    render(conn, "index.json", users: users)
  end

  def index(conn, params) do
    user = TimeManager.get_user_by_attrs!(params)
    render(conn, "show.json", user: user)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- TimeManager.create_user(user_params) do
      user = TimeManager.load_user_assoc(user)
      conn
      |> put_status(:created)
      |> render("show.json", user: user)
    end
  end

  def create(conn, _params) do
    conn
    |> put_status(:bad_request)
    |> put_view(ApiWeb.ErrorView)
    |> render("400.json")
  end

  def show(conn, %{"userID" => id}) do
    user = TimeManager.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def show(conn, _params) do
    conn
    |> put_status(:bad_request)
    |> put_view(ApiWeb.ErrorView)
    |> render("400.json")
  end

  def update(conn, %{"userID" => id, "user" => user_params}) do
    user = TimeManager.get_user!(id)
    with {:ok, %User{} = user} <- TimeManager.update_user(user, user_params) do
      user = TimeManager.load_user_assoc(user)
      conn
      |> put_status(:created)
      |> render("show.json", user: user)
    end
  end

  def update(conn, _params) do
    conn
    |> put_status(:bad_request)
    |> put_view(ApiWeb.ErrorView)
    |> render("400.json")
  end

  def delete(conn, %{"userID" => id}) do
    user = TimeManager.get_user!(id)

    with {:ok, %User{}} <- TimeManager.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end

  def delete(conn, _params) do
    conn
    |> put_status(:bad_request)
    |> put_view(ApiWeb.ErrorView)
    |> render("400.json")
  end
end

defmodule ApiWeb.TimeManager.WorkingTimeController do
  use ApiWeb, :controller

  alias Api.TimeManager
  alias Api.TimeManager.WorkingTime

  action_fallback ApiWeb.FallbackController

  def index(conn, params = %{"userID" => _userID, "start" => _start}) do
    working_times = TimeManager.filter_working_times(params)
    render(conn, "index.json", working_times: working_times)
  end

  def index(conn, params = %{"userID" => _userID, "end" => _end}) do
    working_times = TimeManager.filter_working_times(params)
    render(conn, "index.json", working_times: working_times)
  end

  def index(conn, params = %{"userID" => _userID, "start" => _start, "end" => _end}) do
    working_times = TimeManager.filter_working_times(params)
    render(conn, "index.json", working_times: working_times)
  end

  def index(conn, %{"userID" => userID}) do
    user = TimeManager.get_user!(userID)
    working_times = user.working_times
    render(conn, "index.json", working_times: working_times)
  end

  def index(conn, _params) do
    conn
    |> put_status(:bad_request)
    |> put_view(ApiWeb.ErrorView)
    |> render("400.json")
  end

  def create(conn, %{"userID" => userID, "working_time" => working_time_params}) do
    user = TimeManager.get_user!(userID)
    with {:ok, %WorkingTime{} = working_time} <- TimeManager.create_working_time(user, working_time_params) do
      conn
      |> put_status(:created)
      |> render("show.json", working_time: working_time)
    end
  end

  def create(conn, _params) do
    conn
    |> put_status(:bad_request)
    |> put_view(ApiWeb.ErrorView)
    |> render("400.json")
  end

  def show(conn, %{"userID" => userID, "workingtimeID" => id}) do
    user = TimeManager.get_user!(userID)
    working_time = TimeManager.get_working_time!(id)
    cond do
      Enum.member?(user.working_times, working_time) ->
        render(conn, "show.json", working_time: working_time)
      true ->
        conn
        |> put_view(ApiWeb.ErrorView)
        |> render("404.json")
    end
  end

  def show(conn, _params) do
    conn
    |> put_status(:bad_request)
    |> put_view(ApiWeb.ErrorView)
    |> render("400.json")
  end

  def update(conn, %{"id" => id, "working_time" => working_time_params}) do
    working_time = TimeManager.get_working_time!(id)

    with {:ok, %WorkingTime{} = working_time} <- TimeManager.update_working_time(working_time, working_time_params) do
      render(conn, "show.json", working_time: working_time)
    end
  end

  def update(conn, _params) do
    conn
    |> put_status(:bad_request)
    |> put_view(ApiWeb.ErrorView)
    |> render("400.json")
  end

  def delete(conn, %{"id" => id}) do
    working_time = TimeManager.get_working_time!(id)

    with {:ok, %WorkingTime{}} <- TimeManager.delete_working_time(working_time) do
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

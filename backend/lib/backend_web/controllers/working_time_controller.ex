defmodule TimeManagerApiWeb.WorkingTimeController do
  use TimeManagerApiWeb, :controller

  require Logger

  alias TimeManagerApi.WorkingTimeContext
  alias TimeManagerApi.WorkingTimeContext.WorkingTime

  action_fallback TimeManagerApiWeb.FallbackController

  def index(conn, _params) do
    working_times = WorkingTimeContext.list_working_times()
    render(conn, "index.json", working_times: working_times)
  end

  def getLastWorkingTime(conn, %{"user_id" => id}) do
    working_time = WorkingTimeContext.get_last_working_time!(id)
    render(conn, "show.json", working_time: working_time)
  end

  def create(conn, %{"working_time" => working_time_params}) do
    Logger.debug "!!!! VAR VALUE: #{inspect(working_time_params)}"
    with {:ok, %WorkingTime{} = working_time} <- WorkingTimeContext.create_working_time(working_time_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.working_time_path(conn, :show, working_time))
      |> render("show.json", working_time: working_time)
    end
  end

  def stopWorkingTime(conn, %{"user_id" => id, "working_time" => working_time_params}) do
    working_time = WorkingTimeContext.get_last_ongoing_working_time!(id)

    with {:ok, %WorkingTime{} = working_time} <- WorkingTimeContext.stop_working_time(working_time, working_time_params) do
      render(conn, "show.json", working_time: working_time)
    end
  end

  def show(conn, %{"id" => id}) do
    working_time = WorkingTimeContext.get_working_time!(id)
    render(conn, "show.json", working_time: working_time)
  end

  def getByUserId(conn, %{"id" => id}) do
    working_times = WorkingTimeContext.list_working_times_by_user_id(id)
    render(conn, "index.json", working_times: working_times)
  end

  def update(conn, %{"id" => id, "working_time" => working_time_params}) do
    working_time = WorkingTimeContext.get_working_time!(id)

    with {:ok, %WorkingTime{} = working_time} <- WorkingTimeContext.update_working_time(working_time, working_time_params) do
      render(conn, "show.json", working_time: working_time)
    end
  end

  def delete(conn, %{"id" => id}) do
    working_time = WorkingTimeContext.get_working_time!(id)

    with {:ok, %WorkingTime{}} <- WorkingTimeContext.delete_working_time(working_time) do
      send_resp(conn, :no_content, "")
    end
  end
end

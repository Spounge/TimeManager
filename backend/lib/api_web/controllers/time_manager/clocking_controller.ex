defmodule ApiWeb.TimeManager.ClockingController do
  use ApiWeb, :controller

  alias Api.TimeManager
  alias Api.TimeManager.Clocking

  action_fallback ApiWeb.FallbackController

  def index(conn, _params) do
    clockings = TimeManager.list_clockings()
    render(conn, "index.json", clockings: clockings)
  end

  def create(conn, %{"clocking" => clocking_params}) do
    with {:ok, %Clocking{} = clocking} <- TimeManager.create_clocking(clocking_params) do
      conn
      |> put_status(:created)
      |> render("show.json", clocking: clocking)
    end
  end

  def show(conn, %{"userID" => userID}) do
    user = TimeManager.get_user!(userID)
    clocking = user.clocking
    render(conn, "show.json", clocking: clocking)
  end

  def update(conn, %{"id" => id, "clocking" => clocking_params}) do
    clocking = TimeManager.get_clocking!(id)

    with {:ok, %Clocking{} = clocking} <- TimeManager.update_clocking(clocking, clocking_params) do
      render(conn, "show.json", clocking: clocking)
    end
  end

  def delete(conn, %{"id" => id}) do
    clocking = TimeManager.get_clocking!(id)

    with {:ok, %Clocking{}} <- TimeManager.delete_clocking(clocking) do
      send_resp(conn, :no_content, "")
    end
  end

  def toggle(conn, %{"userID" => userID}) do
    user = TimeManager.get_user!(userID)
    clocking = if user.clocking == nil do
      with {:ok, %Clocking{} = clocking} <- TimeManager.create_clocking(user) do
        clocking
      end
    else
      user.clocking
    end
    now = NaiveDateTime.to_iso8601(NaiveDateTime.local_now())
    prev_time = clocking.time
    with {:ok, %Clocking{} = clocking} <- TimeManager.update_clocking(clocking, %{status: !clocking.status, time: now}) do
      if !clocking.status do
        TimeManager.create_working_time(user, %{end: now, start: prev_time})
      end
      render(conn, "show.json", clocking: clocking)
    end
  end
end

defmodule ApiWeb.TimeManager.UserView do
  use ApiWeb, :view
  alias ApiWeb.TimeManager.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      username: user.username,
      email: user.email,
      clocking: render_one(user.clocking, ApiWeb.TimeManager.ClockingView, "clocking.json"),
      working_times: render_many(user.working_times, ApiWeb.TimeManager.WorkingTimeView, "working_time.json")}
  end
end

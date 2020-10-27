defmodule ApiWeb.TimeManager.ClockingView do
  use ApiWeb, :view
  alias ApiWeb.TimeManager.ClockingView

  def render("index.json", %{clockings: clockings}) do
    %{data: render_many(clockings, ClockingView, "clocking.json")}
  end

  def render("show.json", %{clocking: clocking}) do
    %{data: render_one(clocking, ClockingView, "clocking.json")}
  end

  def render("clocking.json", %{clocking: clocking}) do
    %{id: clocking.id,
      status: clocking.status,
      time: clocking.time}
  end
end

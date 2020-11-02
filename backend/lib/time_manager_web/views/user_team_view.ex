defmodule TimeManagerWeb.UserTeamView do
  use TimeManagerWeb, :view
  alias TimeManagerWeb.UserTeamView

  def render("index.json", %{users_teams: users_teams}) do
    %{data: render_many(users_teams, UserTeamView, "user_team.json")}
  end

  def render("show.json", %{user_team: user_team}) do
    %{data: render_one(user_team, UserTeamView, "user_team.json")}
  end

  def render("user_team.json", %{user_team: user_team}) do
    %{id: user_team.id}
  end
end

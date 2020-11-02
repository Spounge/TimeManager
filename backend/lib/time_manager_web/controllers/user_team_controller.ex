defmodule TimeManagerWeb.UserTeamController do
  use TimeManagerWeb, :controller

  alias TimeManager.UserTeamContext
  alias TimeManager.UserTeamContext.UserTeam

  action_fallback TimeManagerWeb.FallbackController

  def index(conn, _params) do
    users_teams = UserTeamContext.list_users_teams()
    render(conn, "index.json", users_teams: users_teams)
  end

  def create(conn, %{"user_team" => user_team_params}) do
    with {:ok, %UserTeam{} = user_team} <- UserTeamContext.create_user_team(user_team_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_team_path(conn, :show, user_team))
      |> render("show.json", user_team: user_team)
    end
  end

  def show(conn, %{"id" => id}) do
    user_team = UserTeamContext.get_user_team!(id)
    render(conn, "show.json", user_team: user_team)
  end

  def update(conn, %{"id" => id, "user_team" => user_team_params}) do
    user_team = UserTeamContext.get_user_team!(id)

    with {:ok, %UserTeam{} = user_team} <- UserTeamContext.update_user_team(user_team, user_team_params) do
      render(conn, "show.json", user_team: user_team)
    end
  end

  def delete(conn, %{"id" => id}) do
    user_team = UserTeamContext.get_user_team!(id)

    with {:ok, %UserTeam{}} <- UserTeamContext.delete_user_team(user_team) do
      send_resp(conn, :no_content, "")
    end
  end
end

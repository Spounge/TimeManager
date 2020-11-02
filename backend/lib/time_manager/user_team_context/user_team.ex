defmodule TimeManager.UserTeamContext.UserTeam do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users_teams" do
    field :user_id, :id
    field :team_id, :id

    timestamps()
  end

  @doc false
  def changeset(user_team, attrs) do
    user_team
    |> cast(attrs, [])
    |> validate_required([])
  end
end

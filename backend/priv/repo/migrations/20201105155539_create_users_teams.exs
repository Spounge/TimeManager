defmodule TimeManagerApi.Repo.Migrations.CreateUsersTeams do
  use Ecto.Migration

  def change do
    create table(:users_teams) do
      add :team_id, references(:users, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:users_teams, [:team_id])
    create index(:users_teams, [:user_id])
  end
end

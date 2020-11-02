defmodule TimeManager.UserTeamContextTest do
  use TimeManager.DataCase

  alias TimeManager.UserTeamContext

  describe "users_teams" do
    alias TimeManager.UserTeamContext.UserTeam

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def user_team_fixture(attrs \\ %{}) do
      {:ok, user_team} =
        attrs
        |> Enum.into(@valid_attrs)
        |> UserTeamContext.create_user_team()

      user_team
    end

    test "list_users_teams/0 returns all users_teams" do
      user_team = user_team_fixture()
      assert UserTeamContext.list_users_teams() == [user_team]
    end

    test "get_user_team!/1 returns the user_team with given id" do
      user_team = user_team_fixture()
      assert UserTeamContext.get_user_team!(user_team.id) == user_team
    end

    test "create_user_team/1 with valid data creates a user_team" do
      assert {:ok, %UserTeam{} = user_team} = UserTeamContext.create_user_team(@valid_attrs)
    end

    test "create_user_team/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = UserTeamContext.create_user_team(@invalid_attrs)
    end

    test "update_user_team/2 with valid data updates the user_team" do
      user_team = user_team_fixture()
      assert {:ok, %UserTeam{} = user_team} = UserTeamContext.update_user_team(user_team, @update_attrs)
    end

    test "update_user_team/2 with invalid data returns error changeset" do
      user_team = user_team_fixture()
      assert {:error, %Ecto.Changeset{}} = UserTeamContext.update_user_team(user_team, @invalid_attrs)
      assert user_team == UserTeamContext.get_user_team!(user_team.id)
    end

    test "delete_user_team/1 deletes the user_team" do
      user_team = user_team_fixture()
      assert {:ok, %UserTeam{}} = UserTeamContext.delete_user_team(user_team)
      assert_raise Ecto.NoResultsError, fn -> UserTeamContext.get_user_team!(user_team.id) end
    end

    test "change_user_team/1 returns a user_team changeset" do
      user_team = user_team_fixture()
      assert %Ecto.Changeset{} = UserTeamContext.change_user_team(user_team)
    end
  end
end

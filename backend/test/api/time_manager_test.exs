defmodule Api.TimeManagerTest do
  use Api.DataCase

  alias Api.TimeManager

  describe "users" do
    alias Api.TimeManager.User

    @valid_attrs %{email: "some email", username: "some username"}
    @update_attrs %{email: "some updated email", username: "some updated username"}
    @invalid_attrs %{email: nil, username: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> TimeManager.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert TimeManager.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert TimeManager.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = TimeManager.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TimeManager.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = TimeManager.update_user(user, @update_attrs)
      assert user.email == "some updated email"
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = TimeManager.update_user(user, @invalid_attrs)
      assert user == TimeManager.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = TimeManager.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> TimeManager.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = TimeManager.change_user(user)
    end
  end

  describe "working_times" do
    alias Api.TimeManager.WorkingTime

    @valid_attrs %{end: ~N[2010-04-17 14:00:00], start: ~N[2010-04-17 14:00:00]}
    @update_attrs %{end: ~N[2011-05-18 15:01:01], start: ~N[2011-05-18 15:01:01]}
    @invalid_attrs %{end: nil, start: nil}

    def working_time_fixture(attrs \\ %{}) do
      {:ok, working_time} =
        attrs
        |> Enum.into(@valid_attrs)
        |> TimeManager.create_working_time()

      working_time
    end

    test "list_working_times/0 returns all working_times" do
      working_time = working_time_fixture()
      assert TimeManager.list_working_times() == [working_time]
    end

    test "get_working_time!/1 returns the working_time with given id" do
      working_time = working_time_fixture()
      assert TimeManager.get_working_time!(working_time.id) == working_time
    end

    test "create_working_time/1 with valid data creates a working_time" do
      assert {:ok, %WorkingTime{} = working_time} = TimeManager.create_working_time(@valid_attrs)
      assert working_time.end == ~N[2010-04-17 14:00:00]
      assert working_time.start == ~N[2010-04-17 14:00:00]
    end

    test "create_working_time/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TimeManager.create_working_time(@invalid_attrs)
    end

    test "update_working_time/2 with valid data updates the working_time" do
      working_time = working_time_fixture()
      assert {:ok, %WorkingTime{} = working_time} = TimeManager.update_working_time(working_time, @update_attrs)
      assert working_time.end == ~N[2011-05-18 15:01:01]
      assert working_time.start == ~N[2011-05-18 15:01:01]
    end

    test "update_working_time/2 with invalid data returns error changeset" do
      working_time = working_time_fixture()
      assert {:error, %Ecto.Changeset{}} = TimeManager.update_working_time(working_time, @invalid_attrs)
      assert working_time == TimeManager.get_working_time!(working_time.id)
    end

    test "delete_working_time/1 deletes the working_time" do
      working_time = working_time_fixture()
      assert {:ok, %WorkingTime{}} = TimeManager.delete_working_time(working_time)
      assert_raise Ecto.NoResultsError, fn -> TimeManager.get_working_time!(working_time.id) end
    end

    test "change_working_time/1 returns a working_time changeset" do
      working_time = working_time_fixture()
      assert %Ecto.Changeset{} = TimeManager.change_working_time(working_time)
    end
  end

  describe "clockings" do
    alias Api.TimeManager.Clocking

    @valid_attrs %{status: true, time: ~N[2010-04-17 14:00:00]}
    @update_attrs %{status: false, time: ~N[2011-05-18 15:01:01]}
    @invalid_attrs %{status: nil, time: nil}

    def clocking_fixture(attrs \\ %{}) do
      {:ok, clocking} =
        attrs
        |> Enum.into(@valid_attrs)
        |> TimeManager.create_clocking()

      clocking
    end

    test "list_clockings/0 returns all clockings" do
      clocking = clocking_fixture()
      assert TimeManager.list_clockings() == [clocking]
    end

    test "get_clocking!/1 returns the clocking with given id" do
      clocking = clocking_fixture()
      assert TimeManager.get_clocking!(clocking.id) == clocking
    end

    test "create_clocking/1 with valid data creates a clocking" do
      assert {:ok, %Clocking{} = clocking} = TimeManager.create_clocking(@valid_attrs)
      assert clocking.status == true
      assert clocking.time == ~N[2010-04-17 14:00:00]
    end

    test "create_clocking/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TimeManager.create_clocking(@invalid_attrs)
    end

    test "update_clocking/2 with valid data updates the clocking" do
      clocking = clocking_fixture()
      assert {:ok, %Clocking{} = clocking} = TimeManager.update_clocking(clocking, @update_attrs)
      assert clocking.status == false
      assert clocking.time == ~N[2011-05-18 15:01:01]
    end

    test "update_clocking/2 with invalid data returns error changeset" do
      clocking = clocking_fixture()
      assert {:error, %Ecto.Changeset{}} = TimeManager.update_clocking(clocking, @invalid_attrs)
      assert clocking == TimeManager.get_clocking!(clocking.id)
    end

    test "delete_clocking/1 deletes the clocking" do
      clocking = clocking_fixture()
      assert {:ok, %Clocking{}} = TimeManager.delete_clocking(clocking)
      assert_raise Ecto.NoResultsError, fn -> TimeManager.get_clocking!(clocking.id) end
    end

    test "change_clocking/1 returns a clocking changeset" do
      clocking = clocking_fixture()
      assert %Ecto.Changeset{} = TimeManager.change_clocking(clocking)
    end
  end
end

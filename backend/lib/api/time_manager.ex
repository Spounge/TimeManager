defmodule Api.TimeManager do
  @moduledoc """
  The TimeManager context.
  """

  import Ecto.Query, warn: false
  alias Api.Repo

  alias Api.TimeManager.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    User
    |> Repo.all()
    |> Repo.preload(:working_times)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id) do
    User
    |> Repo.get!(id)
    |> Repo.preload([:clocking, :working_times])
  end

  def get_user_by_attrs!(%{"email" => email}) do
    User
    |> Repo.get_by!(email: email)
    |> Repo.preload([:clocking, :working_times])
  end

  def get_user_by_attrs!(%{"username" => username}) do
    User
    |> Repo.get_by!(username: username)
    |> Repo.preload([:clocking, :working_times])
  end

  def get_user_by_attrs!(%{"email" => email, "username" => username}) do
    User
    |> Repo.get_by!([email: email, username: username])
    |> Repo.preload([:clicking, :working_times])
  end

  def get_user_by_attrs!(_attrs), do: raise(ApiWeb.Errors.InvalidQuery)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  def load_user_assoc(user) do
    user
    |> Repo.preload([:clocking, :working_times])
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{data: %User{}}

  """
  def change_user(%User{} = user, attrs \\ %{}) do
    User.changeset(user, attrs)
  end

  alias Api.TimeManager.WorkingTime

  @doc """
  Returns the list of working_times.

  ## Examples

      iex> list_working_times()
      [%WorkingTime{}, ...]

  """
  def list_working_times do
    Repo.all(WorkingTime)
  end

  def filter_working_times(%{"userID" => userID, "start" => start_date, "end" => end_date}) do
    with {:ok, start_date} <- NaiveDateTime.from_iso8601(start_date),
         {:ok, end_date} <- NaiveDateTime.from_iso8601(end_date)
    do
      WorkingTime
      |> where([w], w.user_id == ^userID)
      |> where([w], w.start >= ^start_date)
      |> where([w], w.end <= ^end_date)
      |> Repo.all()
    else
      {:error, _msg} -> raise ApiWeb.Errors.InvalidQuery
    end
  end

  def filter_working_times(%{"userID" => userID, "start" => start_date}) do
    with {:ok, start_date} <- NaiveDateTime.from_iso8601(start_date) do
      WorkingTime
      |> where([w], w.user_id == ^userID)
      |> where([w], w.start >= ^start_date)
      |> Repo.all()
    else
      {:error, _msg} -> raise ApiWeb.Errors.InvalidQuery
    end
  end

  def filter_working_times(%{"userID" => userID, "end" => end_date}) do
    with {:ok, end_date} <- NaiveDateTime.from_iso8601(end_date) do
      WorkingTime
      |> where([w], w.user_id == ^userID)
      |> where([w], w.end <= ^end_date)
      |> Repo.all()
    else
      {:error, _msg} -> raise ApiWeb.Errors.InvalidQuery
    end
  end

  def filter_working_times(_attrs), do: raise(ApiWeb.Errors.InvalidQuery)

  @doc """
  Gets a single working_time.

  Raises `Ecto.NoResultsError` if the Working time does not exist.

  ## Examples

      iex> get_working_time!(123)
      %WorkingTime{}

      iex> get_working_time!(456)
      ** (Ecto.NoResultsError)

  """
  def get_working_time!(id), do: Repo.get!(WorkingTime, id)

  @doc """
  Creates a working_time.

  ## Examples

      iex> create_working_time(%{field: value})
      {:ok, %WorkingTime{}}

      iex> create_working_time(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_working_time(user, attrs \\ %{}) do
    # %WorkingTime{}
    Ecto.build_assoc(user, :working_times, attrs)
    |> WorkingTime.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a working_time.

  ## Examples

      iex> update_working_time(working_time, %{field: new_value})
      {:ok, %WorkingTime{}}

      iex> update_working_time(working_time, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_working_time(%WorkingTime{} = working_time, attrs) do
    working_time
    |> WorkingTime.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a working_time.

  ## Examples

      iex> delete_working_time(working_time)
      {:ok, %WorkingTime{}}

      iex> delete_working_time(working_time)
      {:error, %Ecto.Changeset{}}

  """
  def delete_working_time(%WorkingTime{} = working_time) do
    Repo.delete(working_time)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking working_time changes.

  ## Examples

      iex> change_working_time(working_time)
      %Ecto.Changeset{data: %WorkingTime{}}

  """
  def change_working_time(%WorkingTime{} = working_time, attrs \\ %{}) do
    WorkingTime.changeset(working_time, attrs)
  end

  alias Api.TimeManager.Clocking

  @doc """
  Returns the list of clockings.

  ## Examples

      iex> list_clockings()
      [%Clocking{}, ...]

  """
  def list_clockings do
    Repo.all(Clocking)
  end

  @doc """
  Gets a single clocking.

  Raises `Ecto.NoResultsError` if the Clocking does not exist.

  ## Examples

      iex> get_clocking!(123)
      %Clocking{}

      iex> get_clocking!(456)
      ** (Ecto.NoResultsError)

  """
  def get_clocking!(id), do: Repo.get!(Clocking, id)

  @doc """
  Creates a clocking.

  ## Examples

      iex> create_clocking(%{field: value})
      {:ok, %Clocking{}}

      iex> create_clocking(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_clocking(user) do
    Ecto.build_assoc(user, :clocking)
    # |> Clocking.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a clocking.

  ## Examples

      iex> update_clocking(clocking, %{field: new_value})
      {:ok, %Clocking{}}

      iex> update_clocking(clocking, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_clocking(%Clocking{} = clocking, attrs) do
    clocking
    |> Clocking.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a clocking.

  ## Examples

      iex> delete_clocking(clocking)
      {:ok, %Clocking{}}

      iex> delete_clocking(clocking)
      {:error, %Ecto.Changeset{}}

  """
  def delete_clocking(%Clocking{} = clocking) do
    Repo.delete(clocking)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking clocking changes.

  ## Examples

      iex> change_clocking(clocking)
      %Ecto.Changeset{data: %Clocking{}}

  """
  def change_clocking(%Clocking{} = clocking, attrs \\ %{}) do
    Clocking.changeset(clocking, attrs)
  end
end

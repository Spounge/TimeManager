defmodule Api.TimeManager.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :username, :string
    has_many :working_times, Api.TimeManager.WorkingTime
    has_one :clocking, Api.TimeManager.Clocking

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email])
    |> validate_required([:username, :email])
    |> validate_format(:email, ~r/^[^@\s]+@[^@\s\.]+\.[^@\.\s]+$/)
    |> unique_constraint(:username)
    |> unique_constraint(:email)
  end
end

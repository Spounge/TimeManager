defmodule TimeManagerApi.UserContext.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :password, :string
    field :username, :string
    field :role_id, :id

    has_one :role, TimeManagerApi.RoleContext.Role
    has_many :working_times, TimeManagerApi.WorkingTimeContext.WorkingTime

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name, :username, :email, :password, :role_id])
    |> validate_required([:first_name, :last_name, :username, :email, :password, :role_id])
  end
end

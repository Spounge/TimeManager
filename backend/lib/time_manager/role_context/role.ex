defmodule TimeManager.RoleContext.Role do
  use Ecto.Schema
  import Ecto.Changeset

  schema "roles" do
    field :name, :string

    has_many :users, TimeManager.UserContext.User

    timestamps()
  end

  @doc false
  def changeset(role, attrs) do
    role
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end

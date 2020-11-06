defmodule TimeManagerApi.TeamContext.Team do
  use Ecto.Schema
  import Ecto.Changeset

  schema "teams" do
    field :name, :string
    field :manager_id, :id

    has_many :users, TimeManagerApi.UserContext.User
    has_one :manager, TimeManagerApi.UserContext.User

    timestamps()
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end

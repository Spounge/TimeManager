defmodule TimeManagerApi.WorkingTimeContext.WorkingTime do
  use Ecto.Schema
  import Ecto.Changeset

  schema "working_times" do
    field :end, :naive_datetime
    field :start, :naive_datetime
    field :user_id, :id

    has_one :user, TimeManagerApi.UserContext.User

    timestamps()
  end

  @doc false
  def changeset(working_time, attrs) do
    working_time
    |> cast(attrs, [:start, :end, :user_id])
    |> validate_required([:user_id])
  end
end

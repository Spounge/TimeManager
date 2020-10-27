defmodule Api.TimeManager.WorkingTime do
  use Ecto.Schema
  import Ecto.Changeset

  schema "working_times" do
    field :end, :naive_datetime
    field :start, :naive_datetime
    belongs_to :user, Api.TimeManager.User

    timestamps()
  end

  @doc false
  def changeset(working_time, attrs) do
    working_time
    |> cast(attrs, [:end, :start])
    |> validate_required([:end, :start])
  end
end

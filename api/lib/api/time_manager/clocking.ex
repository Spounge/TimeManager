defmodule Api.TimeManager.Clocking do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clockings" do
    field :status, :boolean, default: false
    field :time, :naive_datetime
    belongs_to :user, Api.TimeManager.User

    timestamps()
  end

  @doc false
  def changeset(clocking, attrs) do
    clocking
    |> cast(attrs, [:status, :time])
    # |> validate_required([:status, :time])
  end
end

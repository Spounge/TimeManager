defmodule Api.Repo.Migrations.CreateClockings do
  use Ecto.Migration

  def change do
    create table(:clockings) do
      add :status, :boolean, default: false, null: false
      add :time, :naive_datetime, default: "1900-01-01 00:00:00", null: false
      add :user_id, references(:users, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:clockings, [:user_id])
  end
end

defmodule SignDict.Repo.Migrations.CreateVote do
  use Ecto.Migration

  def change do
    create table(:votes) do
      add :user_id, :integer
      add :video_id, :integer

      timestamps()
    end

    create unique_index(:votes, [:user_id, :video_id])
  end
end

defmodule SignDict.Repo.Migrations.AddIndexOnTextEntries do
  use Ecto.Migration

  def change do
    alter table(:entries) do
      add :text_vector, :tsvector
    end
    execute "CREATE INDEX text_entries_index ON entries USING GIN(text_vector)"
  end
end

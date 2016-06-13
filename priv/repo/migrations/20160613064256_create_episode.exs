defmodule AppscoastFm.Repo.Migrations.CreateEpisode do
  use Ecto.Migration

  def change do
    create table(:episodes) do
      add :title, :string
      add :description, :string
      add :thumbnail, :string
      add :audio_file, :string
      add :podcast_id, references(:podcasts, on_delete: :nothing)

      timestamps
    end
    create index(:episodes, [:podcast_id])

  end
end

defmodule AppscoastFm.Repo.Migrations.CreatePodcast do
  use Ecto.Migration

  def change do
    create table(:podcasts) do
      add :email, :string
      add :password, :string
      add :title, :string
      add :description, :string
      add :thumbnail, :string
      add :episode_number, :integer
      add :itunes, :string
      add :stitcher, :string
      add :podbay, :string

      timestamps
    end

  end
end

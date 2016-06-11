defmodule AppscoastFm.Repo.Migrations.ChangePodcastPassword do
  use Ecto.Migration

  def change do
    alter table(:podcasts) do
      add :password_hash, :string
      remove :password
    end
  end
end

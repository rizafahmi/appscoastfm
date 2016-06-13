defmodule AppscoastFm.EpisodeTest do
  use AppscoastFm.ModelCase

  alias AppscoastFm.Episode

  @valid_attrs %{audio_file: "some content", description: "some content", thumbnail: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Episode.changeset(%Episode{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Episode.changeset(%Episode{}, @invalid_attrs)
    refute changeset.valid?
  end
end

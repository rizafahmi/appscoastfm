defmodule AppscoastFm.PodcastTest do
  use AppscoastFm.ModelCase

  alias AppscoastFm.Podcast

  @valid_attrs %{description: "some content", email: "some content", episode_number: 42, itunes: "some content", password: "some content", podbay: "some content", stitcher: "some content", thumbnail: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Podcast.changeset(%Podcast{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Podcast.changeset(%Podcast{}, @invalid_attrs)
    refute changeset.valid?
  end
end

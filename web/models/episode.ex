defmodule AppscoastFm.Episode do
  use AppscoastFm.Web, :model
  use Arc.Ecto.Model

  schema "episodes" do
    field :title, :string
    field :description, :string
    field :thumbnail, AppscoastFm.EpisodeThumbnail.Type
    field :audio_file, AppscoastFm.EpisodeAudio.Type
    belongs_to :podcast, AppscoastFm.Podcast

    timestamps
  end

  @required_fields ~w(title description audio_file)
  @optional_fields ~w()

  @required_file_fields ~w()
  @optional_file_fields ~w(thumbnail)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> cast_attachments(params, @required_file_fields, @optional_file_fields)
  end
end

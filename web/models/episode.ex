defmodule AppscoastFm.Episode do
  use AppscoastFm.Web, :model

  schema "episodes" do
    field :title, :string
    field :description, :string
    field :thumbnail, :string
    field :audio_file, :string
    belongs_to :podcast, AppscoastFm.Podcast

    timestamps
  end

  @required_fields ~w(title description thumbnail audio_file)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end

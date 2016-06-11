defmodule AppscoastFm.Podcast do
  use AppscoastFm.Web, :model

  schema "podcasts" do
    field :email, :string
    field :password, :string
    field :title, :string
    field :description, :string
    field :thumbnail, :string
    field :episode_number, :integer
    field :itunes, :string
    field :stitcher, :string
    field :podbay, :string

    timestamps
  end

  @required_fields ~w(email password title description thumbnail episode_number itunes stitcher podbay)
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

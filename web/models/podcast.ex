defmodule AppscoastFm.Podcast do
  use AppscoastFm.Web, :model
  use Arc.Ecto.Model

  schema "podcasts" do
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :title, :string
    field :description, :string
    field :thumbnail, AppscoastFm.PodcastThumbnail.Type
    field :episode_number, :integer
    field :itunes, :string
    field :stitcher, :string
    field :podbay, :string

    has_many :episodes, AppscoastFm.Episode

    timestamps
  end

  @required_fields ~w(email title)
  @optional_fields ~w(description episode_number itunes stitcher podbay)

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

  def registration_changeset(model, params \\ :empty) do
    model
    |> changeset(params)
    |> cast(params, ~w(password), [])
    |> validate_length(:password, min: 4, max: 100)
    |> put_pass_hash()
  end

  defp put_pass_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true,
       changes: %{password: pass}} ->
         put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(pass))
        _ -> changeset
    end
  end
end

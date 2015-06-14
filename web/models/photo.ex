defmodule ChiChan.Photo do
  use ChiChan.Web, :model

  alias ChiChan.Photo
  alias ChiChan.Repo

  schema "photos" do
    field :url, :string
    field :comment, :string
    field :subject, :string

    timestamps
  end

  @required_fields ~w(url)
  @optional_fields ~w(comment, :subject)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  def random(subject \\ "chinami") do
    (from p in Photo, where: p.subject == ^subject, order_by: fragment("RANDOM()"), limit: 1)
    |> Repo.one
  end
end

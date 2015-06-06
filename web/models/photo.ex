defmodule ChiChan.Photo do
  use ChiChan.Web, :model

  schema "photos" do
    field :url, :string
    field :comment, :string

    timestamps
  end

  @required_fields ~w(url)
  @optional_fields ~w(comment)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end

defmodule ChiChan.PhotoController do
  use ChiChan.Web, :controller

  alias ChiChan.Photo

  plug :scrub_params, "photo" when action in [:create, :update]
  plug :action

  def index(conn, _params) do
    photos = Repo.all(Photo)
    render(conn, "index.json", photos: photos)
  end

  def create(conn, %{"photo" => photo_params}) do
    changeset = Photo.changeset(%Photo{}, photo_params)

    if changeset.valid? do
      photo = Repo.insert(changeset)
      render(conn, "show.json", photo: photo)
    else
      conn
      |> put_status(:unprocessable_entity)
      |> render(ChiChan.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    photo = Repo.get(Photo, id)
    render conn, "show.json", photo: photo
  end

  def random(conn, _) do
    photo = (from p in Photo, order_by: fragment("RANDOM()"), limit: 1) |> Repo.one
    render conn, "show.json", photo: photo
  end

  def update(conn, %{"id" => id, "photo" => photo_params}) do
    photo = Repo.get(Photo, id)
    changeset = Photo.changeset(photo, photo_params)

    if changeset.valid? do
      photo = Repo.update(changeset)
      render(conn, "show.json", photo: photo)
    else
      conn
      |> put_status(:unprocessable_entity)
      |> render(ChiChan.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    photo = Repo.get(Photo, id)

    photo = Repo.delete(photo)
    render(conn, "show.json", photo: photo)
  end
end

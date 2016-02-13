defmodule ChiChan.PhotoView do
  use ChiChan.Web, :view

  def render("index.json", %{photos: photos}) do
    %{data: render_many(photos, __MODULE__, "photo.json")}
  end

  def render("show.json", %{photo: photo}) do
    %{data: render_one(photo, __MODULE__, "photo.json")}
  end

  def render("photo.json", %{photo: photo}) do
    %{url: photo.url, comment: photo.comment, subject: photo.subject}
  end
end

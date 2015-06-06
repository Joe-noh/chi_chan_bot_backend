defmodule ChiChan.PhotoView do
  use ChiChan.Web, :view

  def render("index.json", %{photos: photos}) do
    %{data: render_many(photos, "photo.json")}
  end

  def render("show.json", %{photo: photo}) do
    %{data: render_one(photo, "photo.json")}
  end

  def render("photo.json", %{photo: photo}) do
    %{url: photo.url, comment: photo.comment}
  end
end

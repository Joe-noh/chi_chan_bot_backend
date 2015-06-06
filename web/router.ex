defmodule ChiChan.Router do
  use ChiChan.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ChiChan do
    pipe_through :api

    get "/photos/random", PhotoController, :random

    # uncomment this only while mainntenance
    # resources "/photos", PhotoController
  end
end

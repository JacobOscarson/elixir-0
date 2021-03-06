defmodule Phoenix0.Router do
  use Phoenix0.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Phoenix0 do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show
    resources "/messages", MessageController
  end


  # Other scopes may use custom stacks.
  # scope "/api", Phoenix0 do
  #   pipe_through :api
  # end
end

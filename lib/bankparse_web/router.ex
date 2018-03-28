defmodule BankparseWeb.Router do
  use BankparseWeb, :router

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

  scope "/", BankparseWeb do
  pipe_through :browser # Use the default browser stack

  get "/", PageController, :index
  get "/import", PageController, :import 
  post "/parse", PageController, :parse 
  end
  
  scope "/", BankparseWeb do
    pipe_through :browser # Use the default browser stack
    resources "/lists", ListController
  end
  # Other scopes may use custom stacks.
  # scope "/api", BankparseWeb do
  #   pipe_through :api
  # end
end

defmodule BankparseWeb.Router do
  use BankparseWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", BankparseWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :index)
    get("/import", PageController, :import)
    post("/parse", PageController, :parse)
    get("/preparse", PageController, :preparse)
  end

  scope "/", BankparseWeb do
    # Use the default browser stack
    pipe_through(:browser)
    resources("/lists", ListController)
  end

  # Other scopes may use custom stacks.
  # scope "/api", BankparseWeb do
  #   pipe_through :api
  # end
end

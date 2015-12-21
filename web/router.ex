defmodule SlackTopics.Router do
  use SlackTopics.Web, :router

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

  scope "/", SlackTopics do
    pipe_through :browser # Use the default browser stack

    get "/", TopicController, :index
    resources "topics", TopicController, only: [:delete]
  end

  scope "/api", SlackTopics do
    pipe_through :api

    resources "topics", TopicController, only: [:index, :create, :update]
  end
end

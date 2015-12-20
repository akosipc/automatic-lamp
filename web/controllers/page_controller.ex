defmodule SlackTopics.PageController do
  use SlackTopics.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

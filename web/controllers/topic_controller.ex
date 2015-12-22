defmodule SlackTopics.TopicController do
  use SlackTopics.Web, :controller

  alias SlackTopics.Topic

  def index(conn, _params) do
    topics = Repo.all(Topic)
    render conn, topics: topics
  end

  def delete(conn, %{"id" => id}) do
    topic = Repo.get!(Topic, id)
    Repo.delete!(topic)

    conn
    |> put_flash(:info, "Topic successfully deleted")
    |> redirect(to: topic_path(conn, :index))
  end

end

defmodule SlackTopics.TopicController do
  use SlackTopics.Web, :controller

  alias SlackTopics.Topic

  def index(conn, _params) do
    topics = Repo.all(Topic)
    render conn, topics: topics
  end

  def create(conn, _params) do
    changeset = Topic.changeset(%Topic{}, conn.params)

    case Repo.insert(changeset) do
      {:ok, _topic} ->
        render conn, "show.json", topic: _topic
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(SlackTopics.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def update(conn, %{"id" => id}) do
    topic = Repo.get!(Topic, id)
    changeset = Topic.changeset(topic, conn.params)

    case Repo.update(changeset) do
      {:ok, topic} ->
        render conn, "show.json", topic: topic
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(SlackTopics.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def next(conn, %{"id" => id}) do
    topic = Repo.get!(Topic, id)
  end

  def delete(conn, %{"id" => id}) do
    topic = Repo.get!(Topic, id)
    Repo.delete!(topic)

    conn
    |> put_flash(:info, "Topic successfully deleted")
    |> redirect(to: topic_path(conn, :index))
  end

end

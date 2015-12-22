defmodule SlackTopics.V1.TopicController do
  use SlackTopics.Web, :controller

  alias SlackTopics.Topic

  import Ecto.Query, only: [from: 2]

  def index(conn, %{"team_id" => team_id, "channel_id" => channel_id}) do
    query = from t in Topic,
            where: t.team_id == ^team_id and t.channel_id == ^channel_id and t.finished == false

    topics = Repo.all(query) 
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

end

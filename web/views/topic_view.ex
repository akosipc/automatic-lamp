defmodule SlackTopics.TopicView do
  use SlackTopics.Web, :view

  def render("index.json", %{topics: topics}) do
    %{
      attachments: %{
        fallback: "List of Topics that are pending and to be discussed in this channel",
        pretext: "List of Topics that are pending and to be discussed in this channel",
        color: "#00BB00",
        fields: render_many(topics, SlackTopics.TopicView, "topic.json")
      }
    }
  end

  def render("show.json", %{topic: topic}) do
    "Success"
  end

  def render("topic.json", %{topic: topic}) do
    %{
      title: "Posted by #{topic.user_name}",
      value: topic.content,
      short: false
    }
  end

end

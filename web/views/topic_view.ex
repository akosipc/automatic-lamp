defmodule SlackTopics.TopicView do
  use SlackTopics.Web, :view

  def render("index.json", %{topics: topics}) do
    %{data: render_many(topics, SlackTopics.TopicView, "topic.json")}
  end

  def render("show.json", %{topic: topic}) do
    %{data: render_one(topic, SlackTopics.TopicView, "topic.json")}
  end

  def render("topic.json", %{topic: topic}) do
    %{
      id:             topic.id,
      name:           topic.topic,
      channel:        topic.channel,
      organization:   topic.organization,
      token:          topic.token,
      finished:       topic.finished
    }
  end

end

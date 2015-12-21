defmodule SlackTopics.Topic do
  use SlackTopics.Web, :model

  schema "topics" do
    field :topic,           :string
    field :channel,         :string
    field :organization,    :string
    field :token,           :string
    field :finished,        :boolean, default: true

    timestamps
  end

  @required_fields ~w(topic channel)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

end

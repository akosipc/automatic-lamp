defmodule SlackTopics.Topic do
  use SlackTopics.Web, :model

  schema "topics" do
    field :team_id,         :string
    field :team_domain,     :string
    field :channel_name,    :string
    field :channel_id,      :string
    field :user_id,         :string
    field :user_name,       :string
    field :text,            :string
    field :token,           :string
    field :finished,        :boolean, default: false

    timestamps
  end

  @required_fields ~w(content channel_name team_domain token user_name)
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

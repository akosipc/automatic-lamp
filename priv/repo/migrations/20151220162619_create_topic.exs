defmodule SlackTopics.Repo.Migrations.CreateTopic do
  use Ecto.Migration

  def change do
    create table(:topics) do
      add :team_id,       :string
      add :team_domain,   :string
      add :channel_name,  :string
      add :channel_id,    :string
      add :user_id,       :string
      add :user_name,     :string
      add :text ,         :string
      add :token,         :string
      add :finished,      :boolean

      timestamps
    end

  end
end

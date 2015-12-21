defmodule SlackTopics.Repo.Migrations.CreateTopic do
  use Ecto.Migration

  def change do
    create table(:topics) do
      add :topic,         :string
      add :channel,       :string
      add :organization,  :string
      add :token,         :string
      add :finished,      :boolean

      timestamps
    end

  end
end

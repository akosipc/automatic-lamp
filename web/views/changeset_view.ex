defmodule SlackTopics.ChangesetView do
  use SlackTopics.Web, :view

  def render("error.json", %{changeset: changeset}) do
    %{errors: changeset}
  end

end

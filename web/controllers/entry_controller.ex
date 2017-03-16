defmodule SignDict.EntryController do
  use SignDict.Web, :controller

  alias SignDict.Entry
  alias SignDict.Vote

  def show(conn, %{"id" => id}) do
    entry = Repo.get!(Entry, id)
    vote_changeset = Vote.changeset(%Vote{})
    conn
      |> assign(:vote_changeset, vote_changeset)
      |> assign(:entry, entry)
      |> render("show.html")
  end
end

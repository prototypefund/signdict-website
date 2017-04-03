defmodule SignDict.EntryController do
  @moduledoc """
  """
  use SignDict.Web, :controller

  alias SignDict.Entry
  alias SignDict.Repo

  def index(conn, %{"search" => %{"word" => word, "language" => language}}) do
    entries = Entry.search(language, word) |> Repo.all
    render(conn, "index.html", entries: entries)
  end

  def index(conn, params) do
    render(conn, "index.html")
  end

  def show(conn, %{"id" => id}) do
    entry = Entry
      |> Entry.with_language
      |> Entry.with_videos
      |> Repo.get!(id)
    render(conn, "show.html", entry: entry)
  end
end

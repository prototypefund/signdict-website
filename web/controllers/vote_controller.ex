defmodule SignDict.VoteController do
  use SignDict.Web, :controller

  alias SignDict.Vote

  def create(conn, %{"entry_id" => entry_id, "vote" => vote_params}) do
    current_user = conn.assigns.current_user
    changeset = Vote.changeset(%Vote{user_id: current_user.id}, vote_params)

    case Repo.insert(changeset) do
      {:ok, _vote} ->
        conn
          |> put_flash(:info, "You voted successfully.")
          |> redirect(to: entry_path(conn, :show, entry_id))
      {:error, changeset} ->
        conn
          |> put_flash(:error, "You vote failed.")
          |> redirect(to: entry_path(conn, :show, entry_id))
    end
  end
end

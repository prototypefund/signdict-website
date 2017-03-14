defmodule SignDict.VoteTest do
  use SignDict.ModelCase

  import SignDict.Factory

  alias SignDict.Vote

  @valid_attrs %{user_id: 42, video_id: 42}
  @invalid_attrs %{}

  test "changeset of vote default factory" do
    vote = insert(:vote)
    changeset = Vote.changeset(vote)
    assert changeset.valid?
  end

  test "changeset with valid attributes" do
    changeset = Vote.changeset(%Vote{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Vote.changeset(%Vote{}, @invalid_attrs)
    refute changeset.valid?
  end
end

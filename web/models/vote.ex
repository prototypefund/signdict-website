defmodule SignDict.Vote do
  use SignDict.Web, :model

  schema "votes" do
    belongs_to :user, SignDict.User
    belongs_to :video, SignDict.Video

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:user_id, :video_id])
    |> validate_required([:user_id, :video_id])
  end
end

defmodule SignDict.Entry do
  use SignDict.Web, :model

  @types ~w(word phrase example)

  schema "entries" do
    field :text, :string
    field :description, :string
    field :type, :string
    field :text_vector, :string
    belongs_to :language, SignDict.Language
    has_many :videos, SignDict.Video

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:text, :description, :type, :language_id, :text_vector])
    |> validate_required([:text, :description, :type])
    |> validate_inclusion(:type, @types)
    |> foreign_key_constraint(:language_id)
    |> generate_text_vector()
  end

  def with_videos(query) do
    from q in query, preload: :videos
  end

  def with_language(query) do
    from q in query, preload: :language
  end

  def types do
    @types
  end

  def to_string(entry) do
    if is_binary(entry.description) && String.trim(entry.description) != "" do
      "#{entry.text} (#{entry.description})"
    else
      entry.text
    end
  end

  def search(language, word) do
    from q in SignDict.Entry, where: fragment("text_vector @@ to_tsquery('english', ?)", ^word)
  end

  defp generate_text_vector(changeset) do
    # TODO: Find a way to set text_vector based on text value. Have to figure out how...
    changeset
  end
end

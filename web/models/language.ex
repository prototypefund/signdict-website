defmodule SignDict.Language do
  use SignDict.Web, :model

  schema "languages" do
    field :iso6393, :string
    field :long_name, :string
    field :short_name, :string
    field :default_locale, :string

    has_many :entries, SignDict.Entry

    timestamps()
  end

  @languages_for_pg_text_search ~w(danish dutch english finnish french german hungarian
    italian norwegian portuguese romanian russian spanish swedish turkish)

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:iso6393, :long_name, :short_name, :default_locale])
    |> validate_required([:iso6393, :long_name, :short_name, :default_locale])
    |> unique_constraint(:iso6393)
  end

  def name(struct) do
    lang_key = "signlanguage." <> struct.iso6393
    name = Gettext.dgettext(SignDict.Gettext, "signlanguages", lang_key)
    if name != lang_key do
      name
    else
      struct.long_name
    end
  end
end

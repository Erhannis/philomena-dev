defmodule Philomena.Images.Upload do
  use Ecto.Schema
  import Ecto.Changeset

  schema "uploads" do
    field :age, :integer
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(upload, attrs) do
    upload
    |> cast(attrs, [:name, :age])
    |> validate_required([:name, :age])
  end
end

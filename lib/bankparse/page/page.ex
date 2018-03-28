defmodule Bankparse.Page.List do
  use Ecto.Schema
  import Ecto.Changeset


  schema "lists" do
    field :amount, :float
    field :date, :date
    field :place, :string
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(list, attrs) do
    list
    |> cast(attrs, [:date, :place, :amount, :type])
    |> validate_required([:date, :place, :amount, :type])
  end
end

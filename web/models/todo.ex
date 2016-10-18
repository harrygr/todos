defmodule Todos.Todo do
  use Todos.Web, :model

  schema "todos" do
    field :title
    field :description

    timestamps
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :description])
  end
end
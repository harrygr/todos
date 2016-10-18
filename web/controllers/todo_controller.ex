defmodule Todos.TodoController do
  use Todos.Web, :controller

  alias Todos.Todo

  def index(conn, _params) do
    todos = Repo.all(Todo)
    render conn, "index.json", todos: todos
  end

  def show(conn, %{"id" => id}) do
    todo = Repo.get!(Todo, id)
    render conn, "show.json", todo: todo
  end

  def create(conn, params) do
    changeset = Todo.changeset(%Todo{}, params)

    case Repo.insert(changeset) do
      {:ok, todo} -> 
        conn
        |> put_status(:created) 
        |> render("show.json", todo: todo)
    end
  end
end
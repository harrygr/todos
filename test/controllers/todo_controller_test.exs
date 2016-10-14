defmodule Todos.TodoControllerTest do
  use Todos.ConnCase

  test "#index shows a list of todos" do
    conn = build_conn()
    todo = insert(:todo)

    conn = get conn, todo_path(conn, :index)

    assert json_response(conn, 200) == [%{
        "title" => todo.title,
        "description" => todo.description,
        "inserted_at" => Ecto.DateTime.to_iso8601(todo.inserted_at),
        "updated_at" => Ecto.DateTime.to_iso8601(todo.updated_at)
        }]
  end
end
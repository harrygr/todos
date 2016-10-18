defmodule Todos.TodoControllerTest do
  use Todos.ConnCase

  alias Todos.TodoView

  test "#index shows a list of todos" do
    conn = build_conn()
    todo = insert(:todo)

    conn = get conn, todo_path(conn, :index)

    assert json_response(conn, 200) == render_json(TodoView, "index.json", todos: [todo])
  end

  test "#show renders a single todo" do
    conn = build_conn()
    todo = insert(:todo)

    conn = get conn, todo_path(conn, :show, todo)

    assert json_response(conn, 200) == render_json(TodoView, "show.json", todo: todo)
  end

  test "#create adds a new todo" do
    todo = %{title: "Do some shizz", description: "This is required in order to profit"}

    conn = post build_conn(), "/api/todos", todo

    response = json_response(conn, :created) |> Poison.encode! |> Poison.decode!

    %{"title" => returned_title, "description" => returned_description} = response

    assert todo == %{title: returned_title, description: returned_description}

  end
end
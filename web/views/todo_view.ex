defmodule Todos.TodoView do
  use Todos.Web, :view

  def render("index.json", %{todos: todos}) do
    Enum.map(todos, &todo_json/1)
  end

  def todo_json(todo) do
    %{
      title: todo.title,
      description: todo.description,
      inserted_at: todo.inserted_at,
      updated_at: todo.updated_at
    }
  end

  def divide(a ,b)
    case b
      0 -> 
        "no way"
      _ -> 
        a / b
    end
  end
end
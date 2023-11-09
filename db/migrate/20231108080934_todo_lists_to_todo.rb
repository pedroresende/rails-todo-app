class TodoListsToTodo < ActiveRecord::Migration[7.1]
  def change
    add_reference :todos, :todo_list, index: true
  end
end

class AddTodosToTodosLists < ActiveRecord::Migration[7.1]
  def change
    create_join_table :todo_lists, :users
  end
end

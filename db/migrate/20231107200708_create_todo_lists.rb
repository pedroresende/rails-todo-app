class CreateTodoLists < ActiveRecord::Migration[7.1]
  def change
    create_table :todo_lists do |t|
      t.string :title

      t.timestamps
    end

    remove_reference :todos, :user
  end
end

class AddTodoNoteAndReminderFields < ActiveRecord::Migration[7.1]
  def change
    add_column :todos, :note, :text
    add_column :todos, :remind_me, :datetime
  end
end

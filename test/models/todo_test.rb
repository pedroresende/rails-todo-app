require "test_helper"

class TodoTest < ActiveSupport::TestCase
  test "should not save todo without title" do
    user = User.new()
    todo_list = user.todo_lists.new()
    todo = user.todo_lists.first.todos.new()
    assert_not todo.save
  end

  test "should not save todo with title" do
    user = User.new()
    todo_list = user.todo_lists.new()
    todo = user.todo_lists.first.todos.new(title: "test")
    assert todo.save
  end

  test "should not save todo if provided date is before today" do
    user = User.new()
    todo_list = user.todo_lists.new()
    todo = user.todo_lists.first.todos.new(title: "test", due_date: Date.today - 1.day)
    assert_not todo.save
  end

  test "should save todo if provided date is today" do
    user = User.new()
    todo_list = user.todo_lists.new()
    todo = user.todo_lists.first.todos.new(title: "test", due_date: Date.today)
    assert todo.save
  end

  test "should save todo if provided date is tomorrow" do
    user = User.new()
    todo_list = user.todo_lists.new()
    todo = user.todo_lists.first.todos.new(title: "test", due_date: Date.today + 1.day)
    assert todo.save
  end
end

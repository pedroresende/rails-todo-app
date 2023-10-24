require "test_helper"

class TodoTest < ActiveSupport::TestCase
  test "should not save todo without title" do
    todo = Todo.new
    assert_not todo.save
  end

  test "should not save todo with title" do
    todo = Todo.new(title: "test")
    assert todo.save
  end

  test "should not save todo if provided date is before today" do
    todo = Todo.new(title: "test", due_date: Date.today - 1.day)
    assert_not todo.save
  end

  test "should save todo if provided date is today" do
    todo = Todo.new(title: "test", due_date: Date.today)
    assert todo.save
  end

  test "should save todo if provided date is tomorrow" do
    todo = Todo.new(title: "test", due_date: Date.today + 1.day)
    assert todo.save
  end
end

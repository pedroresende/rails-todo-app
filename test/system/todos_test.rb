require "application_system_test_case"

class TodosTest < ApplicationSystemTestCase
  test "Create todo" do
    visit "/"

    fill_in "user_email",	with: "hi@hi.com" 
    fill_in "user_password",	with: "hi@hi.com" 

    click_on "Log in"

    assert_selector "h1", text: "Todo Lists"

    visit "/todo_lists/new"

    assert_selector "h1", text: "New Todo List"

    fill_in "todo_list_title",	with: "Default todo list" 

    click_on "Create"

    assert text: "New Todo List"

    click_on "New Todo List"

    visit "/todo_lists/1/todos/new"

    assert test: "New Todo"

    click_on "Back"

    assert text: "New Todo List"

    visit "/todo_lists/1/todos/new"

    fill_in "todo_title",	with: "new todo"

    click_on "Create"

    assert text: "new todo"
  end
end

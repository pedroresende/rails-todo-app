require "application_system_test_case"

class LoginsTest < ApplicationSystemTestCase
  test "List todos" do
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

    assert_selector "a", text: "Edit"
  end
end

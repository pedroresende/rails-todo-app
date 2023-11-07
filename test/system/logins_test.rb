require "application_system_test_case"

class LoginsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit todos_path
  
    assert_selector "h1", text: "Login"
    assert_selector :button, "Log in"
    assert_selector "a", text: "Sign up"
  end
end

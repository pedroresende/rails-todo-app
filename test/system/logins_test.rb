require "application_system_test_case"

class LoginsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit "/"
  
    assert_selector "h1", text: "Login"
    assert_selector :button, "Log in"
    assert_selector "a", text: "Sign up"
  end

  test "login in" do
    visit "/"

    fill_in "user_email",	with: "hi@hi.com" 
    fill_in "user_password",	with: "hi@hi.com" 

    click_on "Log in"

    assert_selector "h1", text: "Todo Lists"
  end
end

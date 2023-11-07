require "application_system_test_case"

class SignupsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit todos_path

    click_on "Sign up"
  
    assert_selector "h1", text: "Sign up"
    assert_selector "label", text: "Email"
    assert_selector "label", text: "Password"
    assert_selector "label", text: "Password confirmation"

    assert_selector :button, "Sign up"
    assert_selector "a", text: "Log in"
  end

  test "register a new user" do
    visit todos_path

    click_on "Sign up"
  
    fill_in "Email", with: "test@test.com"
    fill_in "Password", with: "test@test.com"
    fill_in "Password confirmation", with: "test@test.com"

    click_on "Sign up"
  end
end

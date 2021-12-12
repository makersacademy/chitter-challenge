require_relative './web_helper'

feature "registering" do
  scenario "a user can sign up" do
    sign_up_test_account

    expect(page).to have_content("You have successfully signed up.")
  end

  scenario "error message shows up if signing in with already exisiting email" do
    sign_up_test_account
    sign_up_test_account

    expect(page).to have_content("Email already exists")
  end

  scenario "error message shows up if signing in with already exisiting email" do
    sign_up_test_account
    click_button("Sign up")
    fill_in(:email, with: "test1234@example.com")
    fill_in(:password, with: "1234")
    fill_in(:name, with: "Test Test")
    fill_in(:username, with: "Test")
    click_button("Sign up")
    

    expect(page).to have_content("Username already exists")
  end
end
require_relative './web_helper'

feature "registering" do
  scenario "a user can sign up" do
    visit("/")
    sign_up_test_account

    expect(page).to have_content("Welcome test@example.com")
  end

  scenario "error message shows up if signing in with already exisiting email" do
    visit("/")
    sign_up_test_account
    sign_up_test_account

    expect(page).to have_content("Email already exists")
  end

  scenario "error message shows up if signing in with already exisiting username" do
    visit("/")
    sign_up_test_account

    click_button("Sign up")
    fill_in(:email, with: "test123@example.com")
    fill_in(:password, with: "1234")
    fill_in(:username, with: "test")
    click_button("Submit")

    expect(page).to have_content("Username already exists")
  end
end
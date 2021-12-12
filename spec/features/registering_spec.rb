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
end
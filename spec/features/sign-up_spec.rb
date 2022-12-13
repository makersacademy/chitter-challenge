require_relative './helper'

feature "a user who does not have an account can sign-in" do
  scenario "a user can enter an email and password to create their account" do
    sign_up
    expect(page).to have_content "Your account has been created, user1@email.com!"
  end
end
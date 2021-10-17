require "pg"
require 'uri'

feature "Registration" do
  scenario "a user can sign-up" do
    visit("/home")
    click_button "Sign Up"
    fill_in('firstname', with: 'Tom')
    fill_in('lastname', with: 'Kellett')
    fill_in('username', with: 'a_user')
    fill_in('email', with: 'test_email@email.com')
    fill_in('password', with: 'password123')
    click_button "Submit"

    expect(page).to have_content ("@a_user")
    expect(page).to have_content ("Tom Kellett")
  end
end

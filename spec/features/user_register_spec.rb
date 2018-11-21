require 'user'
require 'peep'
feature 'User Sign up' do
  scenario 'User can sign up as a new user' do
    visit('/users/new')

    fill_in('name', with: 'Sam')
    fill_in('email', with: 'sam@example.com')
    fill_in('password', with: 'password123')
    click_button('Sign Up')

    expect(page).to have_content("Welcome, sam@example.com")

  end
end

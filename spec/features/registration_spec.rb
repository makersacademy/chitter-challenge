require_relative 'web_helpers'

feature 'registration' do
  # As a social media user
  # So that I can post messages on Chitter as me
  # I want to sign up/register for Chitter
  scenario 'A user can sign up' do
    sign_up
    expect(page).to have_content("Welcome, test@example.com")
  end

  scenario 'email address is already taken' do
    sign_up
    click_button('Sign out')
    visit '/users/new'
    fill_in('email', :with => 'test@example.com')
    fill_in('password', :with => 'password321')
    click_button('Submit')
    expect(page).to have_content('Error: email already taken!')
  end

  scenario 'user must provide a valid email address' do
    visit '/users/new'
    fill_in(:email, with: 'notanemail')
    fill_in(:password, with: 'password123')
    click_button('Submit')
    expect(page).to have_content "You must enter a valid email address!"
  end
end

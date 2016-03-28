# require 'web_helper'

feature 'User can sign in' do
  include Helpers
  scenario 'with correct credentials' do
    sign_up
    sign_in
    expect(page).to have_content("Welcome to Chitter, ghost!")
  end

  scenario "User can't log in with incorrect password" do
    sign_up
    sign_in( password:  'wrong')
    expect(current_path).to eq('/sessions')
    expect(page).to have_content('The email or password is incorrect')
  end

  scenario "User can't log in with incorrect email" do
    sign_up
    sign_in( email:  'han@goog.com')
    expect(current_path).to eq('/sessions')
    expect(page).to have_content('The email or password is incorrect')
  end

  scenario 'User can sign up if not done' do
    visit('/sessions/new')
    click_button('Sign up')
    expect(current_path).to eq('/users/new')
  end

end

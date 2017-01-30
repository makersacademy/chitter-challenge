require 'spec_helper'

feature 'Log in/out' do
  scenario 'can login if correct email and password' do
    sign_up
    sign_in
    expect(page).to have_content "You are logged in as "
  end
  scenario 'cannot login if incorrect email and password' do
    sign_up
    sign_in(password: 'completely wrong')
    expect(page).to have_content "The email or password is incorrect"
  end
  scenario 'can logout' do
    sign_up
    sign_in
    click_button 'Logout'
    expect(page).to have_content('Log in or register to create a new')
    expect(page).not_to have_content('You are logged in as ')
  end
end

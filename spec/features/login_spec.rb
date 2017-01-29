require 'spec_helper'

feature 'Log in/out' do
  scenario 'can login if correct email and password' do
    sign_up
    sign_in
    expect(page).to have_content "You are logged in as "
  end
  scenario 'cannot login if incorrect email and password' do
    sign_up(email: 'eric@example.com',
            password: 'password1',
            password_confirmation: 'password1')
    sign_in(email: 'eric@example.com',   password: '2k*_34dBt?£')
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

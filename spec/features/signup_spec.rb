require './spec/spec_helper'

feature 'signup' do
  scenario 'user can signup to chitter' do
    visit '/'
    fill_in 'newuser_name', with: 'FirstName LastName'
    fill_in 'newuser_username', with: 'User'
    fill_in 'newuser_email', with: 'user@usermail.com'
    fill_in 'newuser_password', with: '123456'
    click_button 'Create user'
    fill_in 'user_name', with: 'User'
    fill_in 'user_password', with: '123456'
    click_button 'Log in'
    expect(page).to have_content 'Welcome, User!'
  end
end

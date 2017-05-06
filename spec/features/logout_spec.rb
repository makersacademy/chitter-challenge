require './spec/spec_helper'

feature 'logout' do
  before do
    @user = User.instance
  end
  scenario 'user is able to log out' do
    visit '/'
    fill_in 'newuser_name', with: 'FirstName LastName'
    fill_in 'newuser_username', with: 'User'
    fill_in 'newuser_email', with: 'user@usermail.com'
    fill_in 'newuser_password', with: '123456'
    click_button 'Create user'
    visit '/'
    click_link 'here'
    fill_in 'user_name', with: 'User'
    fill_in 'user_password', with: '123456'
    click_button 'Log in'
    click_link 'Log out'
    visit '/feed'
    expect(page).to_not have_content 'Welcome, User!'
  end
end

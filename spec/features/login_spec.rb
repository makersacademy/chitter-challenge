require './spec/spec_helper'
require './spec/test_helpers'

feature 'login' do
  scenario 'existent user logs in to chitter' do
    create_user
    visit '/'
    click_link 'here'
    fill_in 'user_name', with: 'User'
    fill_in 'user_password', with: '123456'
    click_button 'Log in'
    expect(page).to have_content 'Welcome, User!'
  end
end

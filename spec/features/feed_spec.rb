require './spec/spec_helper'
require './spec/test_helpers'

feature 'check feed' do
  scenario 'user is able to see peeps from all users' do
    create_user
    visit '/'
    fill_in 'newuser_name', with: 'Bonita'
    fill_in 'newuser_username', with: 'Bonita'
    fill_in 'newuser_email', with: 'bonita@usermail.com'
    fill_in 'newuser_password', with: 'boate'
    click_button 'Create user'
    fill_in 'user_name', with: 'Bonita'
    fill_in 'user_password', with: 'boate'
    click_button 'Log in'
    click_link 'Peep'
    fill_in 'peep', with: 'Lalala'
    click_button 'Peep!'
    visit '/'
    click_link 'here'
    fill_in 'user_name', with: 'User'
    fill_in 'user_password', with: '123456'
    click_button 'Log in'
    visit '/feed'
    expect(page).to have_content 'Bonita Lalala'
  end
end

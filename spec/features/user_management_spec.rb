require 'spec_helper'

feature 'A new user wants to' do
  scenario 'sign up for the first time' do
    visit '/'
    expect(User.count).to eq 0
    expect(page).to have_content 'Welcome to Chitter'
    click_button 'Sign up'
    fill_in 'email', with: 'test@test.com'
    fill_in 'password', with: 'test123'
    fill_in 'password_confirmation', with: 'test123'
    fill_in 'name', with: 'Test Smith'
    fill_in 'username', with: 'test_user1'
    click_button 'submit'
    expect(page).to have_content 'Welcome test_user1!'
    expect(User.count).to eq 1
  end
end
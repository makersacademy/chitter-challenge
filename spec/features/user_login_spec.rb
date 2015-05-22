require 'spec_helper'
require 'helpers/user_helpers'

feature 'A user tries to login' do

  before(:each) do
    User.create(email: 'test@test.com',
                password: '123',
                password_confirmation: '123',
                name: 'John Smith',
                username: 'test_user1')
  end

  scenario 'with correct details and is successful' do
    visit '/'
    expect(page).to have_content 'Please login here'
    login('test_user1', '123')
    expect(current_path).to eq '/main'
    expect(page).to have_content 'Welcome back John Smith'
  end

  scenario 'with incorrect password and encounters an error' do
    visit '/'
    expect(page).to have_content 'Please login here'
    login('test_user1', 'wrong')
    expect(current_path).to eq '/'
    expect(page).to have_content 'The username or password was incorrect'
    expect(page).not_to have_content 'Welcome back John Smith'
  end

  scenario 'with incorrect username and encounters an error' do
    visit '/'
    expect(page).to have_content 'Please login here'
    login('wrong', '123')
    expect(current_path).to eq '/'
    expect(page).to have_content 'The username or password was incorrect'
    expect(page).not_to have_content 'Welcome back John Smith'
  end
end
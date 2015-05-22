require 'spec_helper'
require 'helpers/user_helpers'

feature 'A registered user' do

  before(:each) do
    User.create(email: 'test@test.com',
                password: '123',
                password_confirmation: '123',
                name: 'John Smith',
                username: 'test_user1')
  end

  scenario 'wants to login' do
    visit '/'
    expect(page).to have_content 'Please login here'
    login
    expect(current_path).to eq '/main'
    expect(page).to have_content 'Welcome back John Smith'
  end
end
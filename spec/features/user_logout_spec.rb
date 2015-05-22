require 'spec_helper'
require 'helpers/user_helpers'

feature 'A registered user' do

  before(:each) do
    User.create(email: 'test@test.com',
                password: '123',
                password_confirmation: '123',
                name: 'John Smith',
                username: 'test_user1')
    login
  end

  scenario 'wants to logout' do
    visit '/main'
    expect(page).to have_content 'Welcome back John Smith'
    click_button 'Logout'
    expect(page).to have_content 'Goodbye!'
    expect(page).to_not have_content 'Welcome John Smith'
  end
end
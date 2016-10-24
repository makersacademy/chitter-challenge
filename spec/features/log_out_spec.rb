require 'spec_helper'

feature 'User can log out' do
  before(:each) do
    User.create(name: 'Test',
                username: 'Test',
                email: 'test@test.com',
                password: 'test',
                password_confirmation: 'test')
  end

  scenario 'While logged in a user can log out' do
    log_in_user(email: 'test@test.com', password: 'test')
    click_button 'Log Out'
    expect(page).to have_content('Farewell!')
    expect(page).not_to have_content('Welcome, Test')
  end
end

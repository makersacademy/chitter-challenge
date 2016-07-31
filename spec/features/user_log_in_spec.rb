# As a Maker
# So that I can post messages on Chitter as me
# I want to log in to Chitter
require 'spec_helper'

feature 'User logs in' do
  scenario 'a previously registered user logs in' do
    visit '/'
    click_link 'sign in'
    expect(page.status_code).to eq(200)
  end

  let!(:user)do
    User.create(full_name: 'Alwin Solanky', username:'alwins',
              email: 'alwins@gmail.com',
              password: 'password123', password_confirmation: 'password123')
  end

  scenario 'user logs in with correct details' do
    sign_in(username: user.username, password: user.password)
    expect(page).to have_content "Welcome #{user.full_name}"
  end

end

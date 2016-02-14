require_relative 'web_helper'

feature 'existing user can successfully sign in' do
  scenario 'successful signin takes user to peeps root' do
    User.create(username: 'TestUser1', name: 'Bobby Test', email: 'test@testmail.com', password: 'password', password_confirmation: 'password')
    sign_in
    expect(current_path).to eq('/peeps')
  end
end

feature 'existing user not signed in if incorrect password' do
  scenario 'unsuccessful signin puts error message' do
    User.create(username: 'TestUser1', name: 'Bobby Test', email: 'test@testmail.com', password: 'password', password_confirmation: 'password')
    sign_in(password: 'wrong')
    expect(page).to have_content 'Email or password is incorrect'
  end
end

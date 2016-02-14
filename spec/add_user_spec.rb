require 'web_helper'

feature 'User can sign up' do
  scenario 'Sign up a new user' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome, SteveSmith")
    expect(User.first.email).to eq('steve@stevesmail.com')
  end

  scenario 'requires a matching confirmation password' do
  expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
end
end

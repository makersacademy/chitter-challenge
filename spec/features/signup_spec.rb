require 'spec_helper'
require './app/models/user'
# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: 'vero@example.com'
  fill_in :password, with: 'password!'
  click_button 'Sign up'
end

feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, vero@example.com')
    expect(User.first.email).to eq('vero@example.com')
  end
end

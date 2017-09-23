require 'web_helper'
require './app/models/user.rb'

feature 'User can sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, ben@sunderland.eu.com')
    expect(User.first.email).to eq('ben@sunderland.eu.com')
  end
end

# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

require 'web_helper'

feature 'User sign up' do
  scenario 'I can sign up for Chitter' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Bob Builder')
    expect(page).to have_content('@bobthebuilder')
    expect(User.first.email).to eq('bob@example.com')
  end
end

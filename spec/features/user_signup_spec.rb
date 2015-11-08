require 'spec_helper'

feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, mynameistest')
    expect(User.first.email).to eq('test@example.com')
  end
end

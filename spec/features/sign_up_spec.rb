require 'helper.rb'
require_relative '../../app/models/user'

feature 'User capabilities' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, scott@example.com')
    expect(User.first.email).to eq('scott@example.com')
  end
end

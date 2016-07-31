require 'spec_helper.rb'

# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter and see a welcome messgae

feature 'User registration' do
  scenario 'I can sign up as a new user' do
    expect { register }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome to Chitter")
  end

  scenario 'requires a matching confirmation password' do
    expect { register(password_confirmation: 'wrong') }.not_to change(User, :count)
  end
end

require 'spec_helper'

feature 'Signing up to Chitter' do
  scenario 'Create a new user' do
    visit('users/new')
    fill_in 'user_name', with: 'bobber'
    fill_in 'name', with: 'bob'
    fill_in 'email', with: 'bob@bob.com'
    fill_in 'password', with: 'bob123'

    click_button('Create')

    expect(User.first.email).to eq('bob@bob.com')
  end
end

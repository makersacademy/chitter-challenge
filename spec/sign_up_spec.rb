require 'spec_helper'

feature 'Signing up to Chitter' do

  def sign_up(email: 'bob@bob.com',
    password: 'bob123',
    password_confirmation: 'bob123')
    visit '/users/new'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Create'
  end

  scenario 'Create a new user' do
    sign_up
    expect(User.first.email).to eq('bob@bob.com')
  end

  scenario 'when passwords don\'t match' do
  sign_up
  expect(current_path).to eq('/users')
  expect(page).to have_content 'Password and confirmation password do not match'
end

  end

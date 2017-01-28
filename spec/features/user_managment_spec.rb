require 'spec_helper'
=begin
require_relative '../web_helper.rb'

feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, franklin.shaw@gmail.com')
    expect(User.first.email).to eq('franklin.shaw@gmail.com')
  end
  scenario 'require a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Passwords do not match'
  end
end
=end

feature 'user sign up page' do
  scenario 'its there' do
    visit '/'
    expect(page).to have_content('Please')
  end
end

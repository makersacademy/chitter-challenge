require 'spec_helper'
require_relative '../web_helper.rb'

=begin
  scenario 'require a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Passwords do not match'
  end
end
=end

feature 'User sign up page' do
  scenario 'its there' do
    visit '/'
    expect(page).to have_content('Please')
  end
  scenario 'you can fill in the boxes' do
    visit '/'
    click_button "Go straight to feed"
    expect(current_path).to eq('/feed')
  end
end

feature 'sign up' do
  scenario 'i can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(User.first.email).to eq('franklin.shaw@gmail.com')
  end
end

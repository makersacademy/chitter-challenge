require 'spec_helper'
require_relative 'helpers/user'

include UserHelpers

feature 'Feature - User Sign Up' do

  scenario 'succeeds with required details' do
    expect { sign_up }.to change(User, :count).by 1
    expect(page).to have_content 'Welcome, sanjsanj@hotmail.com'
    expect(User.first.email).to eq 'sanjsanj@hotmail.com'
    expect(User.first.user_name).to eq 'Sanjay Purswani'
    expect(User.first.user_handle).to eq 'sanjsanj'
  end

  scenario 'fails without password confirmation' do
    expect { sign_up 'a@a.com', 'pass', 'wrong' }.to change(User, :count).by 0
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Password does not match the confirmation'
  end

end

feature 'Feature - User Signs In' do

  before(:each) do
    User.create email: 'sanjsanj@hotmail.com',
                password: 'password', password_confirmation: 'password',
                user_name: 'Sanjay Purswani', user_handle: 'sanjsanj'
  end

  scenario 'succeeds with correct credentials' do
    visit '/'
    expect(page).not_to have_content 'Welcome, sanjsanj@hotmail.com'
    sign_in 'sanjsanj@hotmail.com', 'password'
    expect(page).to have_content 'Welcome, sanjsanj@hotmail.com'
  end

  scenario 'fails without correct credentials' do
    visit '/'
    expect(page).not_to have_content 'Welcome, sanjsanj@hotmail.com'
    sign_in 'sanjsanj@hotmail.com', 'wrong'
    expect(page).not_to have_content 'Welcome, sanjsanj@hotmail.com'
  end

end

feature 'Feature - User Sign Out' do

  before(:each) do
    User.create email: 'sanjsanj@hotmail.com',
                password: 'password', password_confirmation: 'password',
                user_name: 'Sanjay Purswani', user_handle: 'sanjsanj'
  end

  scenario 'succeeds while being signed in' do
    sign_in 'sanjsanj@hotmail.com', 'password'
    click_button 'Sign out'
    expect(page).to have_content('Good bye!')
    expect(page).not_to have_content('Welcome, sanjsanj@hotmail.com')
  end

end

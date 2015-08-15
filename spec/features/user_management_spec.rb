require 'spec_helper'

feature 'user registration' do
  scenario 'see a Sign up page' do
    visit '/users/new'
    expect(page).to have_content 'Sign up for Chitter'
  end

  scenario 'nothing occurs if only email is entered' do
    #user = build :user
    visit '/users/new'
    fill_in :email, with: 'diegoregules@gmail.com'
    click_button 'Sign Up'
    expect(current_path).to eq '/users/new'
    expect(page).not_to have_content 'Welcome'
    #expect(User.count).to eq 0
  end

  scenario 'nothing occurs if only password is entered' do
    visit '/users/new'
    fill_in :password, with: '12345'
    click_button 'Sign Up'
    expect(current_path).to eq '/users/new'
    expect(page).not_to have_content 'Welcome'
    #expect(User.count).to eq 0
   end
#   have_content "Welcome to Chitter, diegoregules@gmail.com"


end
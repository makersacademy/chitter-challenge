require_relative '../../app.rb'
require 'spec_helper'
require 'pg'

feature Chitter do

  feature 'Viewing all peeps' do
    scenario 'User is able to see all peeps' do
      sign_up
      post
      expect(page).to have_content "#{Time.now.asctime} - SW22:\nHello World!"
    end
  end

  feature 'Adding a peep' do
    scenario 'User is able to add a new peep' do
      sign_up
      post
      expect(page).to have_content "SW22:\nHello World!"
    end

    scenario 'Stops user from creating a tweet unless they are signed up' do
      visit('/')
      expect(page).not_to have_button "Post new Peep"
    end
  end

  feature 'Signing up' do
    scenario 'User can sign up to Chitter' do
      sign_up
      expect(page).to have_content "Welcome, SW22"
    end

    scenario 'Error if username already exists' do
      User.create('example@hotmail.co.uk', '1234', 'Sam Worrall', 'SW22')
      sign_up
      expect(page).to have_content "This username already exists"
    end
  end

  feature 'Logging out' do
    scenario 'User logs out' do
      sign_up
      click_button 'Log Out'
      expect(page).to have_content "Successfully logged out"
    end

    scenario 'User cannot post after logging out' do
      sign_up
      click_button 'Log Out'
      expect(page).not_to have_button "Post new Peep"
    end
  end

  feature 'Logging in' do

    scenario 'User can log in with existing user details' do
      sign_up
      click_button 'Log Out'
      click_button 'Log In'
      fill_in 'username', with: 'SW22'
      fill_in 'password', with: '1234'
      click_button 'Log In'
      expect(page).to have_content "Username: SW22"
      expect(page).not_to have_button "Log In"
    end

    scenario 'User cannot log in if already logged in' do
      sign_up
      expect(page).not_to have_button "Log In"
    end
  end
end

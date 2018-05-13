require_relative '../../app.rb'
require 'spec_helper'
require 'pg'

feature Chitter do

  feature 'Viewing all peeps' do
    scenario 'User is able to see all peeps' do
      visit('/')
      click_button 'Sign Up'
      fill_in 'email', with: 'example@hotmail.co.uk'
      fill_in 'password', with: '1234'
      fill_in 'name', with: 'Sam Worrall'
      fill_in 'username', with: 'SW22'
      click_button 'Sign Up'
      fill_in 'text', with: 'Hello World!'
      fill_in 'author', with: 'SW22'
      click_button 'Post new Peep'
      expect(page).to have_content "#{Time.now.asctime} - SW22:\nHello World!"
    end
  end

  feature 'Adding a peep' do
    scenario 'User is able to add a new peep' do
      visit('/')
      click_button 'Sign Up'
      fill_in 'email', with: 'example@hotmail.co.uk'
      fill_in 'password', with: '1234'
      fill_in 'name', with: 'Sam Worrall'
      fill_in 'username', with: 'SW22'
      click_button 'Sign Up'
      fill_in 'text', with: 'Hello World!'
      fill_in 'author', with: 'SW22'
      click_button 'Post new Peep'
      expect(page).to have_content "SW22:\nHello World!"
    end

    scenario 'Stops user from creating a tweet unless they are signed up' do
      visit('/')
      fill_in 'text', with: 'Hello World!'
      fill_in 'author', with: 'User'
      click_button 'Post new Peep'
      expect(page).to have_content "You cannot post as User unless you sign in as User"
    end
  end

  feature 'Signing up' do
    scenario 'User can sign up to Chitter' do
      visit ('/')
      click_button 'Sign Up'
      fill_in 'email', with: 'example@hotmail.co.uk'
      fill_in 'password', with: '1234'
      fill_in 'name', with: 'Sam Worrall'
      fill_in 'username', with: 'SW22'
      click_button 'Sign Up'
      expect(page).to have_content "Welcome, SW22"
    end
  end
end

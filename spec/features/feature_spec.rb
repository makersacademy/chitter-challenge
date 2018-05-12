require_relative '../../app.rb'
require 'spec_helper'
require 'pg'

feature Chitter do

  feature 'Viewing all peeps' do
    scenario 'User is able to see all peeps' do
      visit('/')
      fill_in 'text', with: 'Hello World!'
      fill_in 'author', with: 'Sam Worrall'
      click_button 'Post new Peep'
      expect(page).to have_content "#{Time.now.asctime} - Sam Worrall:\nHello World!"
    end
  end

  feature 'Adding a peep' do
    scenario 'User is able to add a new peep' do
      visit('/')
      fill_in 'text', with: 'Hello World!'
      fill_in 'author', with: 'User'
      click_button 'Post new Peep'
      expect(page).to have_content "User:\nHello World!"
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
      expect(page).to have_content "Logged in as SW22"
    end
  end
end

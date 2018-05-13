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
      post
      expect(page).to have_content "You cannot post as SW22 unless you sign in as SW22"
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
end

require_relative 'web_helpers'
require 'rails_helper'

RSpec.feature 'Peeps' do

  # As a Maker
  # So that I can let people know what I am doing
  # I want to post a message (peep) to chitter

  # As a Maker
  # So that I can better appreciate the context of a peep
  # I want to see the time at which it was made

  context 'Creating' do

    before do
      Timecop.freeze(Time.local(2018, 12, 17, 05, 10, 0))
    end

    after do
      Timecop.return
    end

    scenario 'A Maker can post a peep and see its content + timestamp' do
      sign_up
      click_link 'Create new peep'
      post_peep
      expect(page).to have_content 'First peep'
      expect(page).to have_content 'I love summer!'
      expect(page).to have_content 'Created at 05:10AM on 17/12/2018'
    end
  end

 # As a maker
 # So that I can see what others are saying
 # I want to see all peeps in reverse chronological order

  context 'Displaying of peeps' do

    scenario 'Peeps will appear on the main page in reverse chronological order' do
      sign_up
      click_link 'Create new peep'
      post_peep
      visit '/peeps/new'
      fill_in :peep_title, with: 'Second peep'
      fill_in :peep_body, with: 'I love winter!'
      click_button 'Save Peep'
      visit '/'
      expect(page).to have_content 'First peep'
      expect(page).to have_content 'Second peep'
    end

  end

  # As a Maker
  # So that I can post messages on Chitter as me
  # I want to sign up for Chitter

  context 'Sign up/log in/log out' do

    scenario 'A Maker is able to sign up' do
      sign_up
      expect(page).to have_content 'Welcome! You have signed up successfully.'
    end

    scenario 'A Maker is able to sign in' do
      sign_up
      click_link 'Log out'
      log_in
      expect(page).to have_content 'Signed in successfully.'
    end

    scenario 'A Maker is able to log out' do
      sign_up
      click_link 'Log out'
      expect(page).to have_content 'Signed out successfully.'
    end

  end

end

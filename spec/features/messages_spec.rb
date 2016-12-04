require 'spec_helper'
require './app/app.rb'

feature 'messages' do
  scenario 'messages are able to be viewed' do
    visit '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content("peep 1")
      expect(page).to have_content("peep 2")
    end
  end

  scenario 'so that only a user can post a message' do
    sign_up
    visit '/peep'
    within('form#peep') do
      fill_in 'name', with: 'Bob'
      fill_in 'message', with: 'Peep from Bob'
      click_button('Peep')
    end

  end

end

require 'spec_helper'
require './app/app.rb'

feature 'peeps' do
  scenario 'peeps are able to be viewed' do
    sign_up
    sign_in
    visit '/peep'
    within('form#peep') do
      fill_in 'message', with: 'Peep from Bob'
      click_button('Peep')
      visit '/peep'
    end
    within('form#peep') do
      fill_in 'message', with: 'Peep2/frm Bob'
      click_button('Peep')
      visit '/peeps'
    end

    within 'ul#peeps' do
      expect(page).to have_content("Peep from Bob")
      expect(page).to have_content("Peep2/frm Bob")
    end
  end

  scenario 'so that only a user can post a message' do
    visit '/peep'
    expect(page).to have_content("Please sign in first to Peep")
  end

end

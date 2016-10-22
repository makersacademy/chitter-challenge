require 'spec_helper'

feature 'User posting peeps' do

  scenario 'cant peep if not signed in' do
    visit '/peeps'
    expect(page).not_to have_button 'Peep'
    expect(page).not_to have_css "textarea"
  end

  scenario 'can post peeps and see them on peeps page' do
    sign_in
    peep("Hey guys! It's my first post!")

    within 'div.peep' do
      within 'div.peeper' do
        expect(page).to have_content 'tadan'
      end
      expect(page).to have_content "Hey guys! It's my first post!"
    end
  end

  
end

require 'spec_helper'

feature 'View peeps' do

  scenario 'peeps are visible' do
    #Peep.create(words: 'Have a banana', email: 'ron@example.com')
    visit '/peeps'
    expect(page.status_code).to eq 200
    within 'ul#peepfeed' do
      expect(page).to have_content('have a banana')
    end
  end
end

require 'spec_helper'

feature 'Public Peeps' do

  scenario 'Users can post peeps to the chitter homepage' do
    visit '/chitter'
    fill_in 'peep', with: 'Here\'s Johny'
    click_button 'Word Vom'
    expect(page).to have_content 'Here\'s Johny'
  end



end

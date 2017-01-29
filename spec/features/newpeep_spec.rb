require 'spec_helper'

feature 'Create peep' do
  scenario 'can create peep if logged in' do
    sign_up
    sign_in
    visit '/newpeep'
    fill_in 'words',   with: 'Would you like a cup of tea?'
    click_button 'Peep'
    expect(current_path).to eq '/peeps'
    within 'ul#peepfeed' do
      expect(page).to have_content('Would you like a cup of tea?')
    end
  end
  scenario 'cannot create peep if not logged in' do
    
  end
end

require 'spec_helper'

feature 'View peeps' do

  scenario 'peeps are visible in reverse order' do
    sign_up
    sign_in
    visit '/newpeep'
    fill_in 'words',   with: 'FirstPeep'
    click_button 'Peep'
    visit '/newpeep'
    fill_in 'words',   with: 'SecondPeep'
    click_button 'Peep'
    expect(current_path).to eq '/peeps'
    within 'ul#peepfeed' do
      expect(page).to have_content /SecondPeep.*FirstPeep/
    end
  end

end

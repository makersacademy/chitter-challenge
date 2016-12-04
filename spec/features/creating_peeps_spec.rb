require 'spec_helper.rb'

feature 'creating new peeps' do

  scenario 'user can create a new peep' do
    visit '/chitter'
    fill_in 'message', with: 'I have just joined Chitter!'
    click_button 'peep'

    within 'ul#peeps' do
      expect(page).to have_content('I have just joined Chitter!')
    end
  end

end

require 'pg'

feature 'Adding a new peep' do
    scenario 'A user can add a peep' do
      visit('/peeps')
      fill_in('peep', with: 'The zombies are coming!')
      click_button('Submit')
  
      expect(page).to have_content 'The zombies are coming!'
    end
  end
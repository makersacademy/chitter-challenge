feature 'Adding a new peep' do
    scenario 'A user can add a peep to chitter app' do
      visit('/chitter/new')
      fill_in('chitter', with: 'this is a new peep')
  
      expect(page).to have_content 'Hello'
    end
  end

  
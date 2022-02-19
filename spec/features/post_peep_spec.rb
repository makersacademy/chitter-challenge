feature 'Adding a new Peep' do
    scenario 'I can add a Peep on my Chitter' do
      visit('/peeps/new')
      fill_in('peep', with: 'My first Peep')
      click_button('Submit Peep')
  
      expect(page).to have_content 'My first Peep'
    end
  end
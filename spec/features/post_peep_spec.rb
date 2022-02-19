feature 'Adding a new Peep' do
    scenario 'I can add a Peep on my Chitter' do
      visit('/peeps/new')
      fill_in('peep', with: 'I am new to chitter')
      click_button('Submit Peep')
  
      expect(page).to have_content 'I am new to chitter'
    end
  end
feature 'Add a peep' do
  scenario 'Enter and save a new peep' do
    visit 'peeps/new' do
      fill_in :peep, with: 'New Peep'
      expect(page).to have_content 'New Peep'
    end
  end
end

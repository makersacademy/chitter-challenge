feature 'adding a new chitter' do
  scenario 'allows user to add a new peep' do
    visit('/chitter/new')
    fill_in :peeps, with: 'Your new peep'
    click_button 'Chitter'

    expect(page).to have_content('Your new peep')
  end
end

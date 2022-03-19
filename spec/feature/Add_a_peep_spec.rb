feature 'New peep' do
  scenario 'Click on the new peep button to add a peep' do
    visit('/peeps')
    click_button 'New Peep'

    expect(page).to have_current_path('/peep/new')
  end
end
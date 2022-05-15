feature 'Adding a new peep' do
  scenario 'A user can add a Peep to Chitter' do
    visit('/peeps/new')
    fill_in 'peep', with: 'Today has been wonderful!'
    fill_in 'name', with: 'Ocean'
    click_button 'Peep'
    expect(page).to have_content "Today has been wonderful!"
  end
end

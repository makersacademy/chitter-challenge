feature 'Adding a new peep' do
  scenario 'A user can add a peep to chitter' do
    visit('/timeline')
    fill_in('text', with: 'Test Peep')
    click_button('Submit')

    expect(page).to have_content('Test Peep')
  end
end

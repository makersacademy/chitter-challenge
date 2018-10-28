feature 'Adding a new peep' do
  scenario 'A user can add a peep to Chitter Manager' do
    visit('/peeps/new')
    fill_in('peep text', with: 'Test Peep')
    fill_in('name', with: 'Test Name')
    click_button('Submit')

    expect(page).to have_content('Test Name', 'Test Peep')
  end
end

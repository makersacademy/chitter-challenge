feature 'Adding a new peep' do
  scenario 'A user can add a peep to Chitter' do
    visit('/peep/new')
    fill_in('peep', with: 'My first peep!')
    click_button('Submit')

    expect(page).to have_content('My first peep!')
  end
end

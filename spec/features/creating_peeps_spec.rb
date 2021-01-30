feature 'Adding a new peep' do
  scenario 'A user can add a peep to Peep Manager' do
    visit('/peep/new')
    fill_in('peep', with: 'Damn this is a long challenge')
    click_button('Submit')

    expect(page).to have_content 'Damn this is a long challenge'
  end
end
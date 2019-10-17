feature 'Adding a new peep' do
  scenario 'A user can add a peep to the database' do
    visit('/new')
    fill_in('peep', with: 'Im a new peep!')
    click_button('Submit')
    
    expect(page).to have_content 'Im a new peep!'
  end
end

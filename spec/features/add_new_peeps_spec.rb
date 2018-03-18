feature 'Adding a new peep' do
  scenario 'A user can add a peep to the field' do
    visit('/add-a-new-peep')
    fill_in('peep', with: 'This is my first peep')
    click_button('Peep!')

    expect(page).to have_content 'This is my first peep'
  end
end

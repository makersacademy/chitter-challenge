feature 'Adding a new peep' do
  scenario 'A user can add a peep to chitters' do
    visit('/chitter/new')
    fill_in('peep', with: 'This is a new peep!')
    click_button('Submit')

    expect(page).to have_content 'This is a new peep!'
  end
end

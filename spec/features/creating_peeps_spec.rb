feature 'Adding a new peep' do
  scenario 'A user can add a new peep to peep manager' do
    visit('/new')
    fill_in('message', with: 'test message')
    click_button('Submit')

    expect(page).to have_content 'test message'
  end
end

feature 'Adding a peep' do
  scenario 'A user can add a peep to Chitter' do
    visit('/peeps/new')
    fill_in('message', with: 'Hello chickens!')
    click_button('Submit')

    expect(page).to have_content("Hello chickens!")
  end
end

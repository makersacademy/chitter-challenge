feature 'Add new peep' do
  scenario 'A user can add a peep to chitter' do
    visit('/new-peep')
    fill_in('message', with: 'Hello! Adding a peep for the world to see')
    click_button('Post your peep')
    expect(page).to have_content("Hello! Adding a peep for the world to see")
  end
end

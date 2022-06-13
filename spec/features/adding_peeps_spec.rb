feature 'Adding a new peep to Chitter' do
  scenario 'A user can add a new peep message to Chitter' do
    visit('/peeps/new')
    fill_in 'peep', with: "This is a peep"
    fill_in 'name', with: "Clare"
    click_button('Submit peep')

    expect(page).to have_content "This is a peep"
  end
end

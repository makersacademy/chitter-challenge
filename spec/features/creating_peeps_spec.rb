feature 'Creating a new peep' do
  scenario 'A user can add a peep to Chitter' do
    visit('/peeps/create')
    fill_in('peep', with: 'Hello World!')
    click_button('Submit')

    expect(page).to have_content('Hello World!')
  end
end

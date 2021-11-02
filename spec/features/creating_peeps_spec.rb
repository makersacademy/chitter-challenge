feature 'Adding a new peep' do
  scenario 'A user can add a peet to Chitter' do
    visit('/peeps/new')
    fill_in('peep', with: 'Hi! Im using chitter')
    click_button('Submit')

    expect(page).to have_content 'Hi! Im using chitter'
  end
end
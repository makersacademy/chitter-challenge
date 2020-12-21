feature 'creating a peep' do
  scenario 'A user can create a new peep' do
    visit('/')
    click_button('New Peep')
    fill_in('message', with: 'i created a peep')
    click_button('Create Peep')
    expect(page).to have_content 'i created a peep'
  end
end

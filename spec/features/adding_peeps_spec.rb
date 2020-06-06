feature 'Adding a new peep' do
  scenario 'A user can add a peep to the chitter feed' do
    visit('/')
    fill_in('content', with: 'my bonnie lies over the ocean')
    click_button('Peep')

    expect(page).to have_content 'my bonnie lies over the ocean'
  end
end

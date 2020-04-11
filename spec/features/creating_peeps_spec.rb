feature 'Creating a new peep' do
  scenario 'User can create new peep and add them to Chitter' do
    visit('/peep/new')
    fill_in('content', with: '3 million people go hungry')
    click_button('Add New Peep')

    expect(page).to have_content '3 million people go hungry'
  end
end

feature 'Adding a peep' do
  scenario 'A user can add a peep to Chitter' do
    visit('/new')
    fill_in('peep', with: 'Hello Chitter World!')
    click_button('Post')

    expect(page).to have_content 'Hello Chitter World!'
  end
end

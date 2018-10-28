feature 'Creating a peep' do
  scenario 'A user can add a peep to Chitter' do
    visit('/')
    click_button('peep')
    fill_in('post', with: 'My first peep!')
    click_button('Submit')
    expect(page).to have_content('My first peep!')
  end
end

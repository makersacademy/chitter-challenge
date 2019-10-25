feature 'creating a new peep' do
  scenario 'a user can post a peep' do
    visit('/')
    fill_in('tweet', with: 'test tweet')
    click_button('Submit')
    expect(page).to have_content('test tweet')
  end
end

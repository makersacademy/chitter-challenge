feature 'Creating a peep' do
  scenario 'A user can post a peep' do
    visit('/new_peeps')
    fill_in('message', with: 'This is a new peep!')
    click_button('Post Peep')
    expect(page).to have_content('This is a new peep!')
  end
end
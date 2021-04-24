feature 'Adding a peep' do
  scenario 'A user can add a peep' do
    visit('/new')
    fill_in('message', with: 'Adding a Test peep!')
    click_button('Post Peep')
    expect(page).to have_content 'Adding a Test peep!'
  end
end

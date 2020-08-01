feature 'Adding a new peep' do
  scenario 'A user can add a peep to the feed' do
    visit('/peeps')
    click_link('Create new peep!')
    fill_in('message', with: 'A new peep of some kind')
    click_button('Peep')

    expect(page).to have_content 'A new peep of some kind'
  end
end

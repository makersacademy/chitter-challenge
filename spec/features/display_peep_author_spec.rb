feature 'Peep displays author name and username' do
  scenario 'A user can add a peep to the feed' do
    visit('/peeps')
    sign_up
    click_link('Create new peep!')
    fill_in('message', with: 'A new peep of some kind')
    click_button('Peep')
    expect(page).to have_content 'John Doe'
    expect(page).to have_content 'jdoe1982'
  end
end

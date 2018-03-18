feature 'create new peep' do
  scenario 'a user can create a new peep' do
    visit('/peeps/new')
    fill_in('message', with: 'test message')
    click_button('Post')
    expect(page).to have_content "test message"
  end
end

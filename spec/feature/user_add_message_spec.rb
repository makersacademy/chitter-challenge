feature 'content displayed' do
  scenario 'it allows a user to enter a message' do
    visit '/chitter'
    fill_in('message', with: 'Today the elephants will sing.')
    click_button('Submit')
    expect(page).to have_content "Today the elephants will sing."
  end
end

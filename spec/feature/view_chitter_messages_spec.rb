feature 'view Peep messages' do
  scenario 'it allows a user to view all messages saved to Chitter' do
    visit '/chitter'
    fill_in('message', with: 'Tomorrow the elephants will dance.')
    click_button('Submit')
    click_button('Add Message')
    expect(page).to have_content "Tomorrow the elephants will dance."
  end
end

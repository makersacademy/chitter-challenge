feature 'Adding a new message' do
  scenario 'A user can post a message to Chitter' do
    visit('/messages/new')
    fill_in('messages', with: 'test message')
    click_button('Submit')

    expect(page).to have_content 'test message'
  end
end

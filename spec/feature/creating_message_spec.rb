feature 'Adding a new message' do
  scenario 'A user can add a message to Chitter' do
    visit('/messages/post')
    fill_in('message', with: 'Hello, this is a test message.')
    click_button('Submit')
    expect(page).to have_content('Hello, this is a test message.')
  end
end
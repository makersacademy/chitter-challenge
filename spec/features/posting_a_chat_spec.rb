feature 'Posting chats' do
  scenario 'A user can post a chat' do
    visit '/'
    fill_in 'text', with: 'Test chat'
    click_button 'Say Something'

    expect(page).to have_content 'Test chat'
  end
end

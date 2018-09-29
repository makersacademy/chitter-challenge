feature 'Viewing chats' do
  scenario 'visiting the front page' do
    visit '/'
    expect(page).to have_content 'Welcome to Chatter!'
  end

  scenario 'chats are shown in reverse time order' do
    visit '/'
    fill_in 'text', with: 'Test chat 1'
    click_button 'Say Something'
    fill_in 'text', with: 'Test chat 2'
    click_button 'Say Something'
    fill_in 'text', with: 'Test chat 3'
    click_button 'Say Something'

    # doesn't actually test order

    expect(page).to have_content 'Test chat 3'
    expect(page).to have_content 'Test chat 2'
    expect(page).to have_content 'Test chat 1'
  end
end

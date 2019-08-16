feature 'adding a new message' do
  scenario 'a user can add new message to Chitter' do

    visit('/messages/new')
    fill_in('text', with: 'I have my own Chitter!')
    click_button('add')
    message = Chat.all.first
    expect(page).to have_content 'I have my own Chitter!'
    expect(page).to have_content "Posted at: #{message.created_at}"
  end
end
feature 'Update a message' do
  scenario 'A user can update a message' do
    message = Message.create(message: 'Learn Programming')
    visit('/messages')
    expect(page).to have_content('Learn Programming')

    first('.message').click_button 'Edit'
    
    expect(current_path).to eq ("/messages/#{message.id}/edit")

    fill_in('message', with: "Learn Ruby")
    click_button("Submit")

    expect(current_path).to eq '/messages'
    expect(page).to have_content('Learn Ruby')
    expect(page).not_to have_content('Learn Programming')
  end
end
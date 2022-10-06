feature 'Deleting a message' do
  scenario 'A user can delete a message on Chitter' do
    Message.create(message: 'Learn Ruby Programming.')
    visit('/messages')
    expect(page).to have_content('Learn Ruby Programming.')

    first('.message').click_button 'Delete'

    expect(current_path).to eq '/messages'
    expect(page).not_to have_content('Learn Ruby Programming.')
  end
end
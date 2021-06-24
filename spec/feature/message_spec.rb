feature 'Posting a message' do
  scenario 'user can post a new message which is then displayed' do
    visit '/messages/new'
    fill_in 'message', with: 'chitter'
    click_button 'add'
    visit '/messages'
    
    # expect(current_path).to eq('/messages')
    expect(page).to have_content 'chitter'
  end
  
end
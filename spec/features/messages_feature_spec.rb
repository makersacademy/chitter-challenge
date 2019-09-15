xfeature 'Creating new message' do
  scenario 'user posts a new message' do
    visit '/home'
    expect(page).to have_content 'Test message'
  end
end

xfeature 'Displaying all messages' do
  scenario 'user sees all messages' do
    visit '/home'
    fill_in 'new_message', with: 'Test message'
    click_button 'Post'
    expect(page).to have_content 'Test message'
  end
end

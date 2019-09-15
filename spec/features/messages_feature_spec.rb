feature 'Creating new message' do
  scenario 'user posts a new message' do
    visit '/home'
    fill_in 'username', with: 'abc'
    fill_in 'message', with: 'Test message'
    click_button 'Post'
    expect(page).to have_content 'Test message'
  end
end

feature 'Displaying all messages' do
  scenario 'user sees all messages' do
    Message.create(
      username: 'edf',
      msg: 'Test 2',
      created_on: DateTime.new(2019, 1, 1)
    )
    visit '/home'
    expect(page).to have_content 'Test 2'
  end
end

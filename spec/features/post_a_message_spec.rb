feature 'post a message' do
  scenario 'user posts a message' do
    visit '/'
    click_button 'Post a new message'
    fill_in 'message', with: 'TEST'
    click_button 'Post'
    expect(page).to have_content 'TEST'
  end
end

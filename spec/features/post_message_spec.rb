feature 'Post a new message' do
  scenario 'post a new message' do
    visit('/')
    fill_in('message', with: 'This is my first Chitter post')
    click_button('post_message')
    expect(page).to have_content 'This is my first Chitter post'
  end
end

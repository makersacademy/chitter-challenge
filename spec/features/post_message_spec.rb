feature 'Post a new message' do
  scenario 'post a new message' do
    visit('/')
    fill_in('message', with: 'This is my first Chitter post')
    click_button('post_message')
    post = Post.all.first
    expect(page).to have_content "This is my first Chitter post"
    expect(page).to have_content "Posted: #{post['created_at']}"
  end
end

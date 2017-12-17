feature 'Post creation' do
  scenario 'A user can create a new post' do
    register_account
    visit '/posts/new'
    fill_in 'message', with: "Hello world"
    click_on "Post"
    expect(page).to have_content "Hello world"
  end
  scenario 'A user cannot post when not logged in' do
    visit '/posts/new'
    fill_in 'message', with: "A new message"
    click_on "Post"
    expect(page).to have_content "Must be logged in to post"
  end
end

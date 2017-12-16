feature 'Post creation' do
  scenario 'A user can create a new post' do
    visit '/posts/new'
    fill_in 'message', with: "Hello world"
    click_on "Post"
    expect(page).to have_content "Hello world"
  end
end

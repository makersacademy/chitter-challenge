feature 'Viewing posts' do
  scenario 'User can see posts' do
    Post.create(post: "this is a test")
    Post.create(post: "this is also a test")

    visit('/posts')

    expect(page).to have_content "this is a test"
    expect(page).to have_content "this is also a test"
  end
end

feature 'Viewing posts' do
  scenario 'User can see posts' do
    Post.create(post: "this is a test")
    Post.create(post: "this is also a test")

    visit('/posts')

    expect(page).to have_content "this is a test"
    expect(page).to have_content "this is also a test"
  end

  scenario 'The posts should be in reverse order' do
    old_comment = Post.create(post: "this is also a test")
    new_comment = Post.create(post: "newest")

    visit('/posts')

    first_child = find("ul li:first-child")
    expect(first_child).to have_content "newest"
  end
end

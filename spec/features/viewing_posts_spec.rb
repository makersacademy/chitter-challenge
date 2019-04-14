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

  scenario 'shows time of post' do
    time = Time.now
    @time_date = time.strftime("%c")
    allow(Time).to receive(:now).and_return(@time_date)
    visit('/posts')
    click_button('make a post')
    fill_in 'post', with: 'test post'
    click_button('post')
    expect(page).to have_content(@time_date)
  end
end

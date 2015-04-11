feature 'User adds a new link' do
  scenario 'when browsing the homepage' do
    expect(Post.count).to eq(0)
    visit '/'
    add_post('blah blah blah', 'paulwallis42')
    expect(Post.count).to eq(1)
    post = Post.first
    expect(post.peep).to eq('blah blah blah')
    expect(post.user).to eq('paulwallis42')
  end

  scenario 'with a few tags' do
    visit '/'
    add_post('blah blah blah', 'paulwallis42', %w(happy life))
    post = Post.first
    expect(post.tags.map(&:text)).to include 'happy', 'life'
  end

  def add_post(peep, user, tags = [])
    within('#new-post') do
      fill_in 'peep', with: peep
      fill_in 'user', with: user
      fill_in 'tags', with: tags.join(' ')
      click_button 'Add Peep'
    end
  end
end

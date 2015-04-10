feature 'User adds a new post' do
  scenario 'when on homepage' do
    expect(Post.count).to eq (0)
    visit '/'
    add_post('Caron', 'Hello! out there')
    expect(Post.count).to eq(1)
    post = Post.first
    expect(post.username).to eq('Caron')
    expect(post.message).to eq('Hello! out there') 
  end

  def add_post(message)
    within('#new-link') do
      puts @username # will give this more though later
      fill_in 'message', with: message
      click_button 'Add link'
    end
  end
end

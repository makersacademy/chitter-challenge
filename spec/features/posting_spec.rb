
feature 'Users can create a post' do
  scenario 'User creates a post' do
    sign_up
    post_message
    expect(current_path).to eq '/'
    expect(page).to have_content 'This is the best app ever!'
  end

  xscenario 'User can add a post to their account' do
    sign_up
    post_message
    expect(Post.all.map.to include(/This is the best app ever!/))
    # expect(link.tags.map(&:name)).to include('education')
  end
end

feature 'Users can view the time a post was created' do
  scenario 'User creates post and views the time on the index page' do
    sign_up
    post_message
    post = Post.first(user_id: 2)
    expect(page).to have_content "#{post.created_at}"
  end
end

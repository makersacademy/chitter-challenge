
feature 'Users can create a post' do
  scenario 'User creates a post' do
    p '================x'
    p Post.all
    sign_up
    p '================y'
    p Post.all
    post
    p '================z'
    p Post.all
    expect(current_path).to eq '/'
    expect(page).to have_content 'This is the best app ever!'
  end

  scenario 'User can add a post to their account' do
    sign_up
    post
    user = User.first(id: 1)
    p '=============d'
    p user
    expect(Post.all(:user_id => 1).to include('This is the best app ever!'))
    # expect(link.tags.map(&:name)).to include('education')
  end
end

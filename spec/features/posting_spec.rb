
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
    p '=============d1'
    p user = User.first(id: 2)
    p '=============d2'
    p user = User.first(id: 1)


    expect(Post.all(:user_id => 2).to include('This is the best app ever!'))
    # expect(link.tags.map(&:name)).to include('education')
  end
end

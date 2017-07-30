feature 'Create post' do

  let!(:post) do
    time = Time.now
    Post.create(text: 'Hello World!', time: time)
  end

  let!(:user) do
    User.create(email: 'user@user.com',
                password: 'pass',
                password_confirmation: 'pass',
                username: '@user')
  end

  before do
    sign_up(email: 'user@user.com',
                password: 'pass',
                password_confirmation: 'pass',
                username: '@user')
    sign_in(email: user.email, password: user.password)
    new_post(post.text)
  end

  # I want to post a message (peep) to chitter
  scenario 'can post a message' do
    within 'ul#posts' do
      expect(page).to have_content(post.text)
    end
  end

  scenario 'post has an author' do
    expect(page).to have_content(user.username)
  end

  # I want to see the time at which it was made
  scenario 'can see the time a post was made' do
    within 'ul#posts' do
      expect(page).to have_content(post.time)
    end
  end
end

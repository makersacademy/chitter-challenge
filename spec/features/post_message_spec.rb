feature 'Create post' do

  let!(:post) do
    time = Time.now
    Post.create(text: 'Hello World!', time: time)
  end

  before do
    new_post(post.text)
  end

  # I want to post a message (peep) to chitter
  scenario 'can post a message' do
    within 'ul#post' do
      expect(page).to have_content(post.text)
    end
  end

  # I want to see the time at which it was made
  scenario 'can see the time a post was made' do
    within 'ul#post' do
      expect(page).to have_content(post.time)
    end
  end
end

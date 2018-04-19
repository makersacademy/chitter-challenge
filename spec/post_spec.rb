require './lib/post'

describe Post do

  expected_post = [
    Post.new(
      user_id: '1',
      message: 'Hello!',
      created_at: "#{Time.now}",
      id: ''
    )
  ]

  expected_posts = [
    Post.new(
      user_id: '1',
      message: 'Hello!',
      created_at: "#{Time.now}",
      id: '1'
    ),
    Post.new(
      user_id: '2',
      message: 'Today is a good day!',
      created_at: "#{Time.now}",
      id: '3'
    )
  ]

  describe '.all' do
    it 'returns all posts' do
      create_post
      posts = Post.all
      expect(posts.count).to eq(expected_post.count)
      expect(posts[0].user_id).to eq(expected_post[0].user_id)
      expect(posts[0].message).to eq(expected_post[0].message)
    end
  end

  describe '.create' do
    it 'creates new post' do
      create_post
      expect(Post.all.last.message).to eq('Hello!')
    end
  end

  describe '.delete' do # ask
    it 'delets post of active user' do
      create_posts
      Post.delete(2)
      posts = Post.all
      expect(posts.length).to eq(2)
      expect(posts[0].message).to eq(expected_posts[0].message)
    end
  end
  describe '.author' do
    it 'finds author of the post' do
      create_post
      author = User.find(1)
      expect(author.user_name).to eq('Peter')
    end
  end
end

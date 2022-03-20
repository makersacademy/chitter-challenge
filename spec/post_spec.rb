require_relative '../lib/post'
require_relative './database_helpers'
require 'pg'

describe Post do
  let(:time_test) { Time.new(2019, 04, 31, 5, 0, 10)}
  describe '.all' do
    it 'returns all posts' do
      setup_test_database
      post = Post.create(content: "First peep", posted_at: time_test)
      Post.create(content: "Second peep", posted_at: time_test)
      posts = Post.all
      expect(posts.length).to eq 2
      expect(posts.first).to be_a Post
      expect(posts.first.id).to eq post.id
      expect(posts.first.content).to eq "First peep"
      expect(posts.first.posted_at).to eq time_test.strftime('%Y-%m-%d %H:%M:%S')
    end
  end

  describe '.create' do
    it 'creates a new post' do
      post = Post.create(content: 'New peep', posted_at: time_test)
      persisted_data = persisted_data(id: post.id)

      expect(post).to be_a Post
      expect(post.id).to eq persisted_data['id']
      expect(post.content).to eq 'New peep'
      expect(post.posted_at).to eq time_test.strftime('%Y-%m-%d %H:%M:%S')
    end
  end
end
require_relative '../lib/post'
require_relative './database_helpers'

describe Post do
  let(:time_test) { Time.new(2019, 04, 31, 5, 0, 10) }
  describe '.all' do
    it 'returns all posts' do
      connection = PG.connect(dbname: 'chitter_test')
      post = Post.create(username: "Tester", content: "My first Peep", posted_at: time_test)
      Post.create(username: "Tester2", content: "My second Peep", posted_at: time_test)

      posts = Post.all

      expect(posts.length).to eq 2
      expect(posts.first).to be_a Post
      expect(posts.first.id).to eq post.id
      expect(posts.first.username).to eq "Tester"
      expect(posts.first.content).to eq "My first Peep"
      expect(posts.first.posted_at).to eq time_test.strftime('%Y-%m-%d %H:%M:%S')
    end
  end

  describe '.create' do
    it 'creates a new post' do
      post = Post.create(username: "Tester", content: 'New Peep', posted_at: time_test)
      persisted_data = persisted_data(id: post.id)

      expect(post).to be_a Post
      expect(post.id).to eq persisted_data['id']
      expect(post.username).to eq "Tester"
      expect(post.content).to eq 'New Peep'
      expect(post.posted_at).to eq time_test.strftime('%Y-%m-%d %H:%M:%S')
    end
  end
end

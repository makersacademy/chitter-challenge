require_relative '../lib/posts'
require_relative './setup_test_database'
require_relative './database_helpers'

describe Posts do
  describe '.all' do
    it "lists all posts" do
      # connection = PG.connect(dbname: "posts_test")
      # result = connection.exec("INSERT INTO posts (content) VALUES('This is a test post') RETURNING content;")
      # Posts.new(id: result[0]['id'], content: result[0]['content'], date: result[0]['date'])
      Posts.create(content: "This is a test post")

      posts = Posts.all

      expect(posts.first.content).to eq 'This is a test post'
      expect(posts.first).to be_a Posts
    end

    it "lists most recent posts first" do
      Posts.create(content: "This post should be last")
      Posts.create(content: "This post should be second")
      Posts.create(content: "This post should be first")

      posts = Posts.all

      expect(posts.first.content).to eq "This post should be first"
      expect(posts.last.content).to eq "This post should be last"
    end
  end

  describe '.create' do
    it 'creates a new post' do
      post = Posts.create(content: "This is a test post")
      persisted_data = persisted_data(id: post.id, table: 'posts')

      expect(post.id).to eq persisted_data.first['id']
      expect(post.content).to eq "This is a test post"
      expect(post).to be_a Posts
    end
  end
end

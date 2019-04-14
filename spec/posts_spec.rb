require 'post'

describe Post do
  describe '.all' do
    it 'returns all posts' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO posts (post) VALUES ('this is a test');")
      connection.exec("INSERT INTO posts (post) VALUES('this is also a test');")
      posts = Post.all
      expect(posts[0].post).to include("this is a test")
      expect(posts[1].post).to include("this is also a test")
    end
  end

  describe '.create' do
    it 'creates a new post' do
      Post.create(post: 'this is a test')
      expect(Post.all[0].post).to include 'this is a test'
    end
  end
end

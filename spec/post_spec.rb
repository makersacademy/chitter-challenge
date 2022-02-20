require_relative '../lib/post'

describe Post do
  describe '.all' do
    it 'returns all posts' do
      connection = PG.connect(dbname: 'chitter_test')
      Post.create(content: "My first Peep")
      Post.create(content: "My second Peep")

      post = Post.all

      expect(post).to include("My first Peep")
      expect(post).to include("My second Peep")
    end
  end

  describe '.create' do
    it 'creates a new post' do
      Post.create(content: 'New Peep')
      expect(Post.all).to include 'New Peep'
    end
  end
end

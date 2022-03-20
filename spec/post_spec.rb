require_relative '../lib/post'

describe Post do
  describe '.all' do
    it 'returns all posts' do
      connection = PG.connect(dbname: 'chitter_test')
      Post.create(content: "First peep")
      Post.create(content: "Second peep")
      post = Post.all
      expect(post).to include('First peep')
      expect(post).to include('Second peep')
    end
  end

  describe '.create' do
    it 'creates a new post' do
      Post.create(content: 'New peep')
      expect(Post.all).to include 'New peep'
    end
  end
end
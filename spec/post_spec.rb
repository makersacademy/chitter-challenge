require_relative '../lib/post'

describe Post do
  describe '.all' do
    it 'returns all posts' do
      post = Post.all
      expect(post).to include("My first Peep")
      expect(post).to include("My second Peep")
    end
  end

  describe '.create' do
    it 'creates a new post' do
    end
  end
end

require 'post'

describe Post do
  describe '.all' do
    it 'returns all posts' do
      posts = Post.all

      expect(posts).to include("this is a test")
      expect(posts).to include("this is also a test")
    end
  end
end

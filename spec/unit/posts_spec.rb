require 'post'

describe 'Post' do
  describe '.all' do
    it 'shows all posts' do
      posts = Post.all

      expect(posts).to include("Test chit 01")
      expect(posts).to include("Test chit 02")
      expect(posts).to include("Test chit 03")
    end
  end

end

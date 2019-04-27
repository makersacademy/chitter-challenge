require 'post'

describe Post do
  describe '.create' do
    it 'creates a new post' do
      message = "First peep"
      expect(Post.create(message)).to eq message
    end
  end

  describe '.all' do
    it 'shows a list of all posts' do
      message = "First peep"
      Post.create(message)
      expect(Post.all).to include message
    end
  end
end

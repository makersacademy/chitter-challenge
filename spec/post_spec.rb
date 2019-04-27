require 'post'

describe Post do
  describe '.create' do
    it 'creates a new post' do
      message = "First peep"
      expect(Post.create(message)).to eq message
    end
  end
end

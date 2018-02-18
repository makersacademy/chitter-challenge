require 'Comment'

describe Comment do
  describe '.all' do
    it 'returns all comments' do
      comments = Comment.all
      texts = comments.map(&:text)
      expect(texts).to include("lol")
    end
  end

  describe '.add' do
    it 'adds a link to the database' do
      Comment.add("mean", "1")
      comments = Comment.all
      texts = comments.map(&:text)
      expect(texts).to include ("mean")
    end
  end

end

require 'comment'

describe Comment do
  context '.all' do
    it 'returns an array of all comments' do
      expect(described_class.all.first.comment).to eq 'Im hungry'
    end
  end

  context '.create' do
    it 'adds a new comment to the database' do
      described_class.create(comment: 'I love food')
      expect(described_class.all.last.comment).to eq 'I love food'
    end
  end

end

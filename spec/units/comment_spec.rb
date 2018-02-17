require 'comment'

describe Comment do
  context '.all' do
    it 'returns an array of all comments' do
      expect(described_class.all).to include 'Im hungry'
    end
  end

  context '.create' do
    it 'adds a new comment to the database' do
      described_class.create('I love food')
      expect(described_class.all).to include 'I love food'
    end
  end
  
end

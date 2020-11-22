require 'cheeps'
# require 'pg'
describe Cheeps do
  describe '.all' do
    it 'returns all cheeps' do
      Cheeps.create(text: 'this is a test cheep')
      Cheeps.create(text: 'this is a 2nd cheep')
      Cheeps.create(text: 'oh, look a third!')
      cheeps = Cheeps.all

      expect(cheeps).to include('this is a test cheep')
      expect(cheeps).to include('this is a 2nd cheep')
      expect(cheeps).to include('oh, look a third!')
    end
  end

  describe '.create' do
    it 'creates a new cheep' do
      Cheeps.create(text: 'Another test cheep!')

      expect(Cheeps.all).to include 'Another test cheep!'
    end
  end
end

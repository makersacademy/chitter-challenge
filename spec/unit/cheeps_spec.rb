require 'cheeps'

describe Cheeps do
  describe '.all' do
    it 'returns all cheeps' do
      cheeps = Cheeps.all

      expect(cheeps).to include('this is a test cheep')
      expect(cheeps).to include('this is a 2nd cheep')
      expect(cheeps).to include('oh, look a third!')
    end
  end
end

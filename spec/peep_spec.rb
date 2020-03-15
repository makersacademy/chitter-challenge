require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all

      expect(peeps).to include('This is my first chitter!')
      expect(peeps).to include('Hey there! This is a peep!')
      expect(peeps).to include('Urgh! The weather today is horrible.')
      expect(peeps).to include('Coronavirus is really killing the mood here')
    end
  end
end
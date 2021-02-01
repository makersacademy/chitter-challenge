require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      Peep.create(message: "Hello Chitter!")
      peeps = Peep.all

      expect(peeps).to include "Hello Chitter!"
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peep.create(message: 'How are you?')
      expect(Peep.all).to include 'How are you?'
    end
  end
end

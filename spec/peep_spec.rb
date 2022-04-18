require 'peep'
require 'pg'

describe Peep do
  describe '.all' do
    it 'returns a list of peeps' do
      Peep.create(content: 'peep 1')
      Peep.create(content: 'peep 2')
      Peep.create(content: 'peep 3')

      peeps = Peep.all

      expect(peeps).to include("peep 1")
      expect(peeps).to include("peep 2")
      expect(peeps).to include("peep 3")
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peep.create(content: 'peep 5')

      expect(Peep.all).to include 'peep 5'
    end
  end
end

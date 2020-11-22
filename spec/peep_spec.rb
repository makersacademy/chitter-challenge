require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      # Add the test data
      Peep.create(script: 'This is my first peep')
      Peep.create(script: 'Why have you used my identity?')

      peeps = Peep.all

      expect(peeps).to include 'This is my first peep'
      expect(peeps).to include 'Why have you used my identity?'
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peep.create(script: 'I love Sundays!')

      expect(Peep.all).to include 'I love Sundays!'
    end
  end
end

require 'peep'

describe Peep do

  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all

      expect(peeps).to include 'First peep'
      expect(peeps).to include 'Second peep'
      expect(peeps).to include 'Third peep'
    end
  end
end
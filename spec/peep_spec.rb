require './app/lib/peep'

describe Peep do
  describe '.all' do
    it 'returns all the peeps' do
      peeps = Peep.all

      expect(peeps).to include("Hello World")
      expect(peeps).to include("Hey, what is happening people")
    end
  end
end

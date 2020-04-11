require 'peep'

describe Peep do
  describe '.all' do
    it 'returns a list of peeps' do
      peeps = Peep.all
  
      expect(peeps).to include 'This is so cool'
      expect(peeps).to include 'I am sending a peep'
      expect(peeps).to include 'Isolation #COVID-19'
    end
  
    it 'causes .exec to be called on the PG class' do
      expect(PG).to receive(:exec).with('SELECT * FROM peeps;')

      peeps = Peep.all
    end
  end
end
require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps in an array' do
      # Add the test data
      peep_1 = Peep.create(username: 'whatapalaver', peep: 'Test peep 1 - Deep')
      peep_2 = Peep.create(username: 'whatapalaver', peep: 'Test peep 2 - Deeper')
      peep_3 = Peep.create(username: 'whatapalaver', peep: 'Test peep 3 - Deepest')
      expected_peeps = [
        peep_1,
        peep_2,
        peep_3
      ]
      expect(Peep.all).to eq expected_peeps
    end
  end
end

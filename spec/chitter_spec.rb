require 'chitter'

RSpec.describe 'Chitter' do
  describe '.all' do
    it 'returns the list of peeps' do
      peeps = Chitter.all

      expect(peeps).to include "peep_1"
      expect(peeps).to include "peep_2"
      expect(peeps).to include "peep_3"
    end
  end
end


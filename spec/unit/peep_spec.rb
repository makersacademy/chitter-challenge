require_relative '../../lib/peep.rb'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all

      expect(peeps).to include "Me, in hell: I was told there would be a “special” place for me?"
      expect(peeps).to include "Congratulations to the Astronauts that left Earth today. Good choice"
    end
  end
end

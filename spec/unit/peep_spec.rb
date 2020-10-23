require_relative '../../lib/peeps.rb'

describe Peeps do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peeps.all

      expect(peeps).to eq(["Me, in hell: I was told there would be a “special” place for me?","Congratulations to the Astronauts that left Earth today. Good choice"])
    end
  end
end

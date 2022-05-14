require 'peep'

describe Peep do
  describe '.all' do
    it 'shows all Peeps' do
      peeps = Peep.all

      expect(peeps).to include('Elon who?')
      expect(peeps).to include('COYS')
      expect(peeps).to include('How almost two o\'clock is it?')
    end
  end
end 
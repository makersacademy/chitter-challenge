require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all

      expect(peeps).to include('I woke up today')
      expect(peeps).to include('I had breakfast')
      expect(peeps).to include('Then went to Makers')
    end
  end
end

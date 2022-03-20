require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all

      expect(peeps).to include('Hello World')
      expect(peeps).to include('Sunny today')
    end
  end
end
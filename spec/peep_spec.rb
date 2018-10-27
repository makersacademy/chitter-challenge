require 'peeps'


describe Peeps do
  describe '.all' do
    it 'returns a list of peeps' do
      peeps = Peeps.all

      expect(peeps).to include "Hello World"
    end
  end
end

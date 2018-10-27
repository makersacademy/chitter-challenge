require 'peeps'


describe Peeps do
  describe '.all' do
    it 'returns a list of peeps' do
      Peeps.create(peep: 'Hello World')

      expect(Peeps.all).to include "Hello World"
    end
  end
end

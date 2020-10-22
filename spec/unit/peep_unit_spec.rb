require 'Peep'

describe Peep do
    describe '#all' do
      it 'returns all peeps' do
        expect(Peep.all).to include("My first peep")
        expect(Peep.all).to include("My second peep")
      end
    end
end

require './lib/chitter'

describe Chitter do
    describe '#Add peep' do
      it 'Adds new peeps' do
        peeps = Chitter.addpeep(peep: 'test peep')
        expect(peeps).to include 'test peep'
      end
    end
end
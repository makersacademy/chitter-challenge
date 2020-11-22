require 'peep'

describe Peep do
    describe '.all' do
        it 'returns all peeps' do
            peeps = Peep.all

            expect(peeps).to include('Hello this is my first peep')
            expect(peeps).to include('Peep peep')
            expect(peeps).to include('Chitter chatter')
        end
    end
end
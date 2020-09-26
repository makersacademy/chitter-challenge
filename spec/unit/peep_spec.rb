require 'peep'

describe Peep do
    describe '#add' do
        it 'Add a peep' do
           peep = Peep.add('Hello World')
            expect(peep.content).to eq('Hello World')
        end
    end
end
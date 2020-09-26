require 'peep'

describe Peep do
    describe '#add' do
        it 'Add a peep' do
            peep = Peep.add('Hello World')
            expect(peep.content).to eq('Hello World')
        end
    end

    describe '#show' do
        it 'Return list of peeps when called'do
            Peep.add('This is a test peep')
            expect(Peep.show[0].content).to eq('This is a test peep') 
        end
    end
end
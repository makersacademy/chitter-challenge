require 'peep'

describe Peep do
    describe '#add' do
        it 'Add a peep' do
            Peep.add('Hello World')
            expect(Peep.show).to eq('Hello World')
        end
    end
end
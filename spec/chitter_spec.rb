require './lib/chitter'

describe Chitter do
    describe '#.all' do
        it 'returns all peeps' do
            expect(Chitter.all).to include 'Test Peep'
        end
    end 
end 

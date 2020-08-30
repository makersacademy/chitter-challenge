require 'peep'

describe Peep do 

    describe '.add_peeps' do
        it 'adds a peep to the database' do
            peep = Peep.add_peeps('chitter is the best!')
            expect(peep.peep).to eq 'chitter is the best!'
        end
    end
    
    describe '.get_peeps' do
        it 'gets peeps from the database' do
            Peep.add_peeps('chitter rules')
            Peep.add_peeps('hello, there')
            peeps = Peep.get_peeps

            expect(peeps.first.peep).to eq 'chitter rules'
            expect(peeps.last.peep).to eq 'hello, there'
        end
    end
end
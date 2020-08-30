require 'peep'

describe Peep do 

    describe '.add_peeps' do
        it 'adds a peep to the database' do
            peep = Peep.add_peeps('chitter is the best!', Time.now)
            expect(peep.peep).to eq 'chitter is the best!'
        end
    end
    
    describe '.get_peeps' do
        it 'gets peeps from the database' do
            Peep.add_peeps('chitter rules', Time.now)
            Peep.add_peeps('General, Kenobi', Time.now)
            peeps = Peep.get_peeps

            expect(peeps.first.peep).to eq 'General, Kenobi'
            expect(peeps.last.peep).to eq 'chitter rules'
        end
    end
end
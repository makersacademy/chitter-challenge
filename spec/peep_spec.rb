require 'pg'
require 'peep'

describe Peep do

    describe '#==' do
        it 'matching ids are equivalent' do
            peep_1 = Peep.create(peep: 'peep')
            expect(peep_1).to eq (peep_1)
        end
    end


    describe '.create' do
        it 'create a new peep' do
            peep = Peep.create(peep: 'my first peep')
            expect(Peep.read).to include peep
        end
    end


    describe '.read' do
        it 'returns all peeps in reverse chronological order' do

            peep_1 = Peep.create(peep: 'peep_1')
            peep_2 = Peep.create(peep: 'peep_2')
            peep_3 = Peep.create(peep: 'peep_3')

            expected_peeps = [
                peep_3,
                peep_2,
                peep_1
            ]

            expect(Peep.read).to eq expected_peeps
        end
    end


end
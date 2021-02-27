require 'Peeps'
require 'pg'

describe Peeps do

    describe '.new_peep' do
        it 'creates a new peep' do
            connection = PG.connect(dbname: 'chitter_test')
            peep = Peeps.new_peep(name: "joanna", username: "jojobrigs", message: "this is my first peep").first

            expect(peep['name']).to eq "joanna"
            expect(peep['username']).to eq "jojobrigs"
            expect(peep['message']).to eq "this is my first peep"
        end
    end

    describe '.view_peeps' do
       it 'shows a list of all peeps' do
        connection = PG.connect(dbname: 'chitter_test')
        Peeps.new_peep(name: "joanna", username: "jojobrigs", message: "this is my first peep")

        peeps = Peeps.view_peeps
        expect(peeps).to include "joanna"
        expect(peeps).to include "jojobrigs"
        expect(peeps).to include "this is my first peep"
       end
    end


end



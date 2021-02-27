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


end



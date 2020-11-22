require 'peep'

describe Peep do
    describe '.all' do
        it 'returns all peeps' do
            connection = PG.connect(dbname: 'chitter_test')
            connection.exec("INSERT INTO peeps (content) VALUES ('First database table peep!')")
            connection.exec("INSERT INTO peeps (content) VALUES ('Peep peep')")
            connection.exec("INSERT INTO peeps (content) VALUES ('Chitter chatter')")
            
            peeps = Peep.all

            expect(peeps).to include('First database table peep!')
            expect(peeps).to include('Peep peep')
            expect(peeps).to include('Chitter chatter')
        end
    end
end
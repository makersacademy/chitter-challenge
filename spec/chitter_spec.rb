require './lib/chitter'

describe Chitter do
    describe '#.all' do
        it 'returns all peeps' do
            connection = PG.connect(dbname: 'chitter_test')
            connection.exec("INSERT INTO chitter_messages (message) VALUES ('Test Peep');")

            chitters = Chitter.all
            expect(chitters).to include ('Test Peep')
        end
    end 

    describe '#.post' do
        it 'creates a new peep' do
            Chitter.post(message: 'Tester Peep')
            
            expect(Chitter.all).to include 'Tester Peep'
        end 
    end 
end 


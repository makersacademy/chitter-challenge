require 'peep'


describe Chitter do 
    describe '.all' do
        it 'returns all peeps' do
            connection = PG.connect(dbname: 'chitter_test')
            
            connection.exec("INSERT INTO peeps (peep) VALUES ('I ate a sandwich today');")
            connection.exec("INSERT INTO peeps (peep) VALUES ('I love sandwiches');")
            
            peeps = Peep.all

            expect(peeps).to  include("I ate a sandwich today")
            expect(peeps).to  include("I love sandwiches")
        end 
    end 
end 
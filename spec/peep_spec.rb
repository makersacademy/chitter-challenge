require 'peeps'
describe Peep do 
    describe '.all' do 
        it 'should show the users peep' do 
            connection = PG.connect(dbname: 'chitter_test')
            connection.exec("INSERT INTO peeps (message) VALUES ('1 peep');")
            connection.exec("INSERT INTO peeps (message) VALUES('2 peep');")
            connection.exec("INSERT INTO peeps (message) VALUES('3 peep');")
        
            peeps = Peep.all 

        expect(peeps).to include('1 peep')
        expect(peeps).to include('2 peep')
        expect(peeps).to include('3 peep')
    end 
end 
end 
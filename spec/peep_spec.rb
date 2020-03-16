  require 'peep.rb'

  describe Peep do 
    describe '.read' do 
      it 'returns all peeps in reverse chronological order' do
        connection = PG.connect(dbname: 'chitter_challenge_test')
        
        connection.exec("INSERT INTO chitter (peeps) VALUES ('Peep 1');")
        connection.exec("INSERT INTO chitter (peeps) VALUES ('Peep 2');")
        connection.exec("INSERT INTO chitter (peeps) VALUES ('Peep 3');")
        
        peeps = Peep.read
        
        expect(peeps).to include("Peep 1")
        expect(peeps).to include("Peep 2")
        expect(peeps).to include("Peep 3")

      end
    end
  end


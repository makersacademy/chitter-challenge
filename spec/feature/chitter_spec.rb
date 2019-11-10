require 'chitter'
require 'pg'

    describe Chitter do
        describe '.all' do
          it 'returns all messages' do
            connection = PG.connect(dbname:'chitter_test')
            connection.exec("INSERT INTO peep (peep) VALUES ('The zombies are coming');")
            connection.exec("INSERT INTO peep (peep) VALUES('Bring food');")
            connection.exec("INSERT INTO peep (peep) VALUES('And Alcohol');")
      
            chitter = Chitter.all
      
            expect(peep).to include("The zombies are coming")
            expect(peep).to include("Bring food")
            expect(peep).to include("And Alcohol")
          end
        end
    end
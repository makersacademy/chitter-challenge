require 'chitter'
require 'pg'

    describe Chitter do
        describe '.all' do
          it 'returns all messages' do
            connection = PG.connect(dbname:'chitter_test')
            connection.exec("INSERT INTO chitter_test (peep) VALUES ('The zombies are coming');")
            connection.exec("INSERT INTO chitter_test (peep) VALUES('Bring food');")
            connection.exec("INSERT INTO chitter_test (peep) VALUES('And Alcohol');")
      
            chitters = Chitter.all
      
            expect(chitter_test).to include("The zombies are coming")
            expect(chitter_test).to include("Bring food")
            expect(chitter_test).to include("And Alcohol")
          end
        end
    end
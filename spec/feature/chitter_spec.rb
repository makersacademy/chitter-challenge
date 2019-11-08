require 'chitter'
require 'pg'

    describe Chitter do
        describe '.all' do
          it 'returns all messages' do
            connection = PG.connect(dbname: 'chitter_test')
            connection.exec("INSERT INTO chitter (message) VALUES ('The zombies are coming');")
            connection.exec("INSERT INTO chitter (message) VALUES('Bring food');")
            connection.exec("INSERT INTO chitter (message) VALUES('And Alcohol');")
      
            chitter = Chitter.all
      
            expect(chitter).to include("The zombies are coming")
            expect(chitter).to include("Bring food")
            expect(chitter).to include("And Alcohol")
          end
        end
    end
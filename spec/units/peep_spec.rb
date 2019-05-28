require 'chitter'
require 'database_helpers'

describe Peep do 
    describe '.all' do
        it 'returns the message that has been posted to chitter' do 
        connection = PG.connect(dbname: 'chitter_test')

        peep = Peep.create(name: "Gary", message: "I am at work")

        expect(peep).to be_a Peep 
        expect(peep.id).to eq peep.id
        expect(peep.name).to eq 'Gary'
        expect(peep.message).to eq 'I am at work'
        end 
    end 
        
    #     connection.exec("INSERT INTO peeps (name) VALUES ('Gary');")
    #     peep = Peep.all
    #     expect(peep).to include('Gary')
    #     end 
    # end
    
    describe '.create' do
        it 'creates a new peep' do
          peep = Peep.create(name: 'Gary', message: 'I am at work')
          persisted_data = persisted_data(id:peep.id)

          expect(peep).to be_a Peep
          expect(peep.id).to eq persisted_data.first['id'] 
          expect(peep.first.name).to eq 'Gary'
          expect(peep.first.message).to eq 'I am at work'
        end
      end
end 
        
            # peep = Peep.create(name: "Gary", message: "Hey, I am working") 

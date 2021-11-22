require_relative '../lib/peep'

describe Peep do 
  
  describe '.all' do
    it 'returns a list of peeps' do

      connection = PG.connect(dbname: 'chitter_test')

    # Add the test data
      connection.exec("INSERT INTO peeps (peep,name,username) VALUES ('peep 1', 'bob', 'bobthebuilder123');")
      connection.exec("INSERT INTO peeps (peep,name,username) VALUES ('another peep', 'adam', '3gg');")
      connection.exec("INSERT INTO peeps (peep,name,username) VALUES ('last peep for now', 'sara', 'sarah123');")

      peeps = Peep.all
  
      expect(peeps).to include ['bob', 'bobthebuilder123', 'peep 1']
      expect(peeps).to include ['adam', '3gg', 'another peep']
      expect(peeps).to include ['sara', 'sarah123', 'last peep for now']
    end
  end

  describe '.create' do
    it 'adds a peep to the database' do

      connection = PG.connect(dbname: 'chitter_test')

    # Add the test data
      Peep.create(peep: 'test peep', name: 'test', username: 'test123')

      peeps = Peep.all
  
      expect(peeps).to include ['test', 'test123', 'test peep']

    end
  end
  
end

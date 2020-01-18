require 'database_connection'

describe DatabaseConnection do 
  
  describe '.setup' do 
    it 'makes a connection to the database' do 
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')
      DatabaseConnection.setup('chitter_test')
    end
  end

  describe '.conncetion' do 
    it 'gets the value of the conncetion we have and lets us determine if its persistent' do 
      connection = DatabaseConnection.setup('chitter_test')
      expect(DatabaseConnection.connection).to eq connection 
    end 
  end 


  describe '.query' do 
    it 'takes in a sql string and passes it the the database' do 
      connection = DatabaseConnection.setup('chitter_test')
      expect(connection).to receive(:exec).with("INSERT INTO peeps(peep) VALUES ('Hey, pal, how be the world');")
      DatabaseConnection.query("INSERT INTO peeps(peep) VALUES ('Hey, pal, how be the world');")
    end 
  end 
end 
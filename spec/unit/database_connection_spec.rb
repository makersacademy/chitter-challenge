require 'database_connection'

describe DatabaseConnection do 
  
  describe '.setup' do 
    it 'makes a connection to the database' do 
      expect(PG).to receive(:connection).with(dbname: 'chitter_test')
      DatabaseConnection.setup('chitter_test')
    end 
  end 


end 
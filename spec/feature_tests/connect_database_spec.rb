require 'connect_database'

RSpec.describe ConnectDatabase do
  describe '.setup' do
    it 'uses postgresql to set up a database connection' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')
      ConnectDatabase.setup('chitter_test')
    end

    it 'continues db connection' do
      
      connection = ConnectDatabase.setup('chitter_test')
      expect(ConnectDatabase.connection).to eq connection
    end
  end
  
  describe '.query' do
    it 'uses postgresql to execute a db query' do
      connection = ConnectDatabase.setup('chitter_test')
  
      expect(connection).to receive(:exec).with("SELECT * FROM peeps;")
  
      ConnectDatabase.query("SELECT * FROM peeps;")
    end
  end
end

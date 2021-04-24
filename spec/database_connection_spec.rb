require 'database_connection'

describe DatabaseConnection do 

  context '#setup' do
    it 'sets up a connection to the database using PG' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')

      DatabaseConnection.setup('chitter_test')
    end 
  end 

  context '#query' do
    it 'can execute a query via PG' do
      connection = DatabaseConnection.setup('chitter_test')

      expect(connection).to receive(:exec).with("SELECT * FROM peeps;")

      DatabaseConnection.query("SELECT * FROM peeps;")
    end
  end
end 
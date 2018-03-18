require 'database_connection'
describe DatabaseConnection do

  describe'.setup' do
    it'setup a new connection with the database provided' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')
      DatabaseConnection.setup('chitter_test')
    end
    it 'show the connection is persistant' do
      connection = DatabaseConnection.setup('chitter_test')
      expect(DatabaseConnection.connection).to eq connection
    end
  end

  describe'.query' do
    it 'use an instance variable for set up' do
      connection = DatabaseConnection.setup('chitter_test')
      expect(connection).to receive(:exec).with('SELECT * FROM peeps;')
      DatabaseConnection.query('SELECT * FROM peeps;')
    end
  end
end

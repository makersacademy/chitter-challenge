require 'database_connection'

describe DatabaseConnection do
  describe '#setup' do
    it 'sets up database connection' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_database_test')
      DatabaseConnection.setup('chitter_database_test')
    end
  end

  describe '#connection' do
    it 'returns the connection to the database' do
      connection = DatabaseConnection.setup('chitter_database_test')
      expect(DatabaseConnection.connection).to eq connection
    end
  end

  describe '#exec' do
    it 'calls exec on database' do
      connection = DatabaseConnection.setup('chitter_database_test')
      expect(connection).to receive(:exec).with("SELECT * FROM peeps")
      connection.exec("SELECT * FROM peeps")
    end
  end

end

require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a connection to the database' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')
      DatabaseConnection.setup('chitter_test')
    end
  end

  describe '.connection' do
    it 'return the connection previously set' do
      connection = DatabaseConnection.setup('chitter_test')
      expect(DatabaseConnection.connection).to eq connection
    end
  end
end
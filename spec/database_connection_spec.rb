require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_web_test')

      DatabaseConnection.setup(dbname: 'chitter_web_test')
    end
  end

  describe '.connection' do
    it 'is a persistant connection' do
      connection = DatabaseConnection.setup(dbname: 'chitter_web_test')

      expect(DatabaseConnection.connection).to eq connection
    end
  end
end

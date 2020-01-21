require 'database_connection'

describe DatabaseConnection do
    describe '.setup' do
      it 'sets up connection to the database' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')

      DatabaseConnection.setup('chitter_test')
    end
  end

  describe '.connection' do
    it 'ensures that connection is persistent' do
      connection =DatabaseConnection.setup('chitter_test')

      expect(DatabaseConnection.connection).to eq connection
    end
  end 

  describe '.query' do
    it 'queries the database' do
      connection =DatabaseConnection.setup('chitter_test')

      expect(connection).to receive(:exec).with("SELECT * from peep;")

      DatabaseConnection.query("SELECT * from peep;")
    end
  end
end

require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a database connection using PG' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test').once
      DatabaseConnection.setup('chitter_test')
    end

    it 'perists the database connection' do
      connection = DatabaseConnection.setup('chitter_test')
      expect(DatabaseConnection.connection).to eq connection
    end
  end

  describe '.query(sql)' do
    it 'executes a given SQL query using PG' do
      connection = DatabaseConnection.setup('chitter_test')
      sql = "SELECT * FROM peeps"

      expect(connection).to receive(:exec).with(sql)
      DatabaseConnection.query(sql)
    end
  end
end
require 'database_connection'

describe DatabaseConnection do
  context '.setup' do
    it 'can setup a connection' do
      expect(PG).to receive(:connect).with(dbname: "chitter_test")
      DatabaseConnection.setup("chitter_test")
    end

    it 'can return a connection' do
      connection = DatabaseConnection.setup("chitter_test")
      expect(DatabaseConnection.connection).to eq connection
    end
  end

  context '.query' do
    it 'can get data from a database' do
      connection = DatabaseConnection.setup("chitter_test")
      expect(connection).to receive(:exec).with("SELECT * FROM messages;")

      DatabaseConnection.query("SELECT * FROM messages;")
    end
  end
end

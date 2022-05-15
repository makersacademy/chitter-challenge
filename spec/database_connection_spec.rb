require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'messages_test')

      DatabaseConnection.setup('messages_test')
    end

  describe '.query' do
    it 'executes a query via PG' do
      connection = DatabaseConnection.setup('messages_test')

      expect(connection).to receive(:exec_params).with("SELECT * FROM messages;", [])

      DatabaseConnection.query("SELECT * FROM messages;")
    end
  end
end

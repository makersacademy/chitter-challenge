require 'databaseconnection'

describe DatabaseConnection do
  context '#setup' do
    it 'sets up a connection to the database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_challenge_test')
      DatabaseConnection.setup('chitter_challenge_test')
    end
  end

  context '#query' do
    it 'executes a query' do
      connection = DatabaseConnection.setup('chitter_challenge_test')
      expect(connection).to receive(:exec).with('SELECT * FROM messages')
      DatabaseConnection.query('SELECT * FROM messages')
    end
  end
end

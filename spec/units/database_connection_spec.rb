require 'database_connection'

describe DatabaseConnection do
  context '#setup' do
    it 'sets up a connection to the database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')
      DatabaseConnection.setup('chitter_test')
    end
  end

  context '#query' do
    it 'executes a query' do
      con = DatabaseConnection.setup('chitter_test')
      expect(con).to receive(:exec).with("SELECT * FROM comments")
      DatabaseConnection.query("SELECT * FROM comments")
    end
  end

end

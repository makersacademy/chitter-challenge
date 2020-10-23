require 'database_connection'

describe DatabaseConnection do
  let(:test_db) { 'chitter_test' }
  
  describe '#setup' do
    it 'creates a connection to the specified database' do
      expect(PG).to receive(:connect).with(dbname: test_db)
      DatabaseConnection.setup(test_db)
    end

    it 'returns the connection to that db' do
      connection = DatabaseConnection.setup(test_db)
      expect(connection).to be_an(PG::Connection)
      expect(connection.db).to eq test_db
    end
  end

  describe '#query' do
    let(:test_query) { "INSERT INTO users(name, username, email, password) VALUES ('a','b','c','d') RETURNING name;" }

    it 'passes a SQL query to the connected database' do
      connection = DatabaseConnection.setup(test_db)
      expect(connection).to receive(:exec).with(test_query)
      DatabaseConnection.query(test_query)
    end

    it 'returns a Result object' do
      DatabaseConnection.setup(test_db)
      expect(DatabaseConnection.query(test_query)).to be_an_instance_of(PG::Result)
    end
  end
end

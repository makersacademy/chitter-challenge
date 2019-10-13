require 'pg'
require 'db_connection'

describe DBConnection do

  describe '.setup' do
    it 'establishes a connection to the database' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')
      DBConnection.setup('chitter_test')
    end
  end

  describe '.query' do
    it 'executes a SQL query on the connected database' do
      db = DBConnection.setup('chitter_test')
      expect(db).to receive(:exec).with('SELECT * FROM users;')
      DBConnection.query('SELECT * FROM users;')
    end
  end

end

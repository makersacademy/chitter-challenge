require 'db_connection'
require 'pg'

describe 'DBConnection' do
  describe '.setup' do
    it 'sets up database connection' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')
      DBConnection.setup('chitter_test')
    end
  end

  describe '.query' do
    it 'executes sql query' do
      connection = DBConnection.setup('chitter_test')
      expect(connection).to receive(:exec).with("SELECT * FROM messages")
      DBConnection.query("SELECT * FROM messages")
    end
  end
end
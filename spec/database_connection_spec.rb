require 'database_connection'

describe DatabaseConnection do

  describe '.setup' do
    it 'sets up a connection through PG' do
      expect(PG).to receive(:connect).with({ dbname: 'blahblah_test' })
      DatabaseConnection.setup(dbname: 'blahblah_test')
    end
  end

  describe '.query' do
    it 'takes a SQL string and executes it' do
      connection = DatabaseConnection.setup(dbname: 'blahblah_test')

      expect(connection).to receive(:exec).with('SELECT * FROM messages')
      expect(DatabaseConnection.query('SELECT * FROM messages'))
    end
  end
end

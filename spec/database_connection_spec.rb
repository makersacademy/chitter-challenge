require 'database_connection'

describe DatabaseConnection do

  describe '.setup' do
    it 'creates a pond with Pond' do
      expect(Pond).to receive(:wrap).with(maximum_size: 10, timeout: 0.5)
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

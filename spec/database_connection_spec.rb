require 'database_connection'

describe DatabaseConnection do

  describe '#self.setup' do
    
    it 'should setup a connection to db with pg' do
      expect(PG).to receive(:connect).with(dbname: 'my_database')
      DatabaseConnection.setup('my_database')
    end

  end

  describe '#self.query' do

    it 'should send a SQL command to database' do
      connection = DatabaseConnection.setup('chitter_test')
      expect(connection).to receive(:exec).with('SELECT * FROM accounts')
      DatabaseConnection.query('SELECT * FROM accounts')
    end

  end

end

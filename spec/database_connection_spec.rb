require './lib/database_connection.rb'

RSpec.describe DatabaseConnection do

  describe '#.create' do
    it 'craete a connection' do
      allow(PG).to receive(:connect).with(dbname: 'chitter_test')
      DatabaseConnection.setup(dbname: 'chitter_test')
    end
  end

  describe '#.query' do
    it 'pass to SQL a query string' do
      connection = DatabaseConnection.setup(dbname: 'chitter_test')
      allow(connection).to receive(:exec).with('SELECT * FROM meassages')
      DatabaseConnection.query('SELECT * FROM meassages')
    end
  end
end

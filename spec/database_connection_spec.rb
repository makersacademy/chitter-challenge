require 'pg'
require 'database_connection'
require 'database_connection_setup'

describe DatabaseConnection do
  describe '#setup' do
    it 'sets up a connection to the chosen database' do
      expect(DatabaseConnection.setup('chitter_test')).to be_a PG::Connection
    end
  end

  describe '#query' do
    it 'makes a SQL query to the set database' do
      drop_test_database
      populate_test_database
      result = DatabaseConnection.query('SELECT * FROM peeps WHERE id=1')
      expect(result.values[0][1]).to eq 'This is chitter'
    end
  end

end

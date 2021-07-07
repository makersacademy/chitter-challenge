require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'connects to the database' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')
      DatabaseConnection.setup('chitter_test')
    end
  end

  describe '.query' do
    it 'can query a statement from a table' do
      DatabaseConnection.setup('chitter_test')
      result = DatabaseConnection.query('SELECT * FROM users')
      expect(result).to be_an_instance_of(PG::Result)
    end
  end
end

require_relative '../../app/models/database_connection'

describe DatabaseConnection do
  describe '#setup' do
    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')

      DatabaseConnection.setup('chitter_test')
    end 
  end

  describe '#query' do
    it 'executes a query via PG' do
      con = DatabaseConnection.setup('chitter_test')
      expect(con).to receive(:exec).with("SELECT * FROM peeps;")
      DatabaseConnection.query("SELECT * FROM peeps;")
    end
  end
end
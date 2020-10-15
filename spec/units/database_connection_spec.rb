describe DatabaseConnection do
  let(:test_db) { 'chitter_test' }
  
  describe '#setup' do
    it 'creates a connection to the specified database' do
      expect(PG).to receive(:connect).with(dbname: test_db)
      connection = DatabaseConnection.setup(test_db)
    end

    it 'returns the connection to that db' do
      connection = DatabaseConnection.setup(test_db)
      expect(connection).to be_an(PG::Connection)
      expect(connection.db).to eq test_db
    end
  end
end

describe DatabaseConnection do

  describe '.setup' do
    it 'creates a connection to a database' do
      expect(PG).to receive(:connect).with(dbname: 'db')
      DatabaseConnection.setup('db')
    end

    it 'persists the database connection' do
      connection = DatabaseConnection.setup('chitter_test')
      expect(DatabaseConnection.connection).to eq connection
    end
  end

  describe '.query' do
    it 'passes SQL query to the database and returns the result' do
      connection = DatabaseConnection.setup('chitter_test')
      expect(connection).to receive(:exec).with("SELECT * FROM peeps;")
      DatabaseConnection.query("SELECT * FROM peeps;")      
    end
  end

end

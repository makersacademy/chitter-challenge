require 'database_connection'

describe DatabaseConnection do

  describe '.setup' do
    it 'it connects to the database and saves the connection as an instance variable' do
      expect(PG).to receive(:connect).with(dbname: 'peeps_test')
      DatabaseConnection.setup(dbname: 'peeps_test')
    end
  end

  describe '.instance' do
    it 'the instance method saves the connection' do
      connection = DatabaseConnection.setup(dbname: 'peeps_test')
      expect(DatabaseConnection.instance). to eq connection
    end
  end

  describe '.query' do
    it 'takes an SQL string and executes it' do
      DatabaseConnection.setup(dbname: 'peeps_test')
      query = DatabaseConnection.query("INSERT INTO peeps (message) VALUES('Test message') RETURNING id;").first
      selection = DatabaseConnection.query("SELECT * FROM peeps").first
      expect(selection['id']).to eq query['id']
    end
  end

end

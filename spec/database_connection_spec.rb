require 'database_connection'

describe DatabaseConnection do
  describe '#connect' do
    it 'connects to database' do
      con = DatabaseConnection.connect('chitter_test')
      expect(DatabaseConnection.database).to eq(con)
    end
  end

  describe '#query' do
    it 'executes given query on peeps table' do
      DatabaseConnection.connect('chitter_test')
      expect(DatabaseConnection.database).to receive(:exec).with("SELECT * FROM peeps;")
      DatabaseConnection.query("SELECT * FROM peeps;")
    end
  end
end

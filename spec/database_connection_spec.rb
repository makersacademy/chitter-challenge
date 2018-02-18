require 'database_connection'
describe DatabaseConnection do
  describe '.setup' do
    it "sets up the connection" do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')
      DatabaseConnection.setup('chitter_test')
    end
  end
  describe '.query' do
    it "executes a query to the database" do
      connect = DatabaseConnection.setup('chitter_test')
      expect(connect).to receive(:exec).with("SELECT * FROM peeps")
      DatabaseConnection.query("SELECT * FROM peeps")
    end
  end
end

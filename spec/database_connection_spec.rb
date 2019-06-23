require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a new connection' do
      allow(PG).to receive(:connect).with(dbname: 'chitter_test')

      DatabaseConnection.setup('chitter_test')
    end
  end

  describe '.query' do
    it "passes a query string to SQL" do
      connection = DatabaseConnection.setup('chitter_test')
      allow(connection).to receive(:exec).with("SELECT * FROM peeps;")

      DatabaseConnection.query("SELECT * FROM peeps;")
    end
  end
end

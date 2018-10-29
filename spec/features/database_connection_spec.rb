require './lib/database_connection.rb'

describe DatabaseConnection do
  describe '.setup' do
    it "sets up a database connection" do
      expect(PG).to receive(:connect).with(dbname: 'chitter_challenge_test')

      DatabaseConnection.setup('chitter_challenge_test')
    end

    it "this connection continues" do
      connection = DatabaseConnection.setup('chitter_challenge_test')

      expect(DatabaseConnection.connection).to eq connection
    end
  end

  describe '.query' do
    it "executes an sql query" do
      connection = DatabaseConnection.setup('chitter_challenge_test')

      expect(connection).to receive(:exec).with("SELECT * FROM peeps;")

      DatabaseConnection.query("SELECT * FROM peeps;")
    end
  end
end

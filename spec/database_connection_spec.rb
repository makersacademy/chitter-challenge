require 'database_connection'

describe DatabaseConnection do

  describe '.setup' do

    it "should connect to PG" do
      expect(PG).to receive(:connect).with(dbname: DB_TEST)

      DatabaseConnection.setup(DB_TEST)
    end

  end

  describe './connection' do

    it "should return the connection" do
      connection = DatabaseConnection.setup(DB_TEST)
      expect(DatabaseConnection.connection).to eq(connection)
    end

  end

  describe '.query' do

    it "should run a query" do
      connection = DatabaseConnection.setup(DB_TEST)
      expect(connection).to receive(:exec).with("SELECT * FROM peeps;")

      DatabaseConnection.query("SELECT * FROM peeps;")
    end

  end

end

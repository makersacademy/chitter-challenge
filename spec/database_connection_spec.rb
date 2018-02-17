require 'database_connection'

describe DatabaseConnection do

  describe ".setup" do
    it "creates a new conneection" do
      expect(PG).to receive(:connect).with(dbname: "chitter_test")
      DatabaseConnection.setup("chitter_test")
    end

    it "creates a persistant connection" do
      connection = DatabaseConnection.setup("chitter_test")
      expect(DatabaseConnection.database).to eq(connection)
    end

  end

end

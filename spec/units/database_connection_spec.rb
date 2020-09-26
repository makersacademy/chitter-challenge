require 'database_connection'

describe DatabaseConnection do
  # describe "#.setup" do
  #   it "connects to a specific database" do
  #     expect(PG).to receive(:connect).with(dbname: 'shore_test')
  #     DatabaseConnection.setup('shore_test')
  #   end
  # end

  describe "#.query" do
    it "executes the SQL query provided on the connection instance variable" do
      connection = DatabaseConnection.setup('shore_test')
      expect(connection).to receive(:exec).with("SELECT * FROM bottles;")
      DatabaseConnection.query("SELECT * FROM bottles;")
    end
  end
end

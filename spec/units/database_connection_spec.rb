require 'database_connection'

describe DatabaseConnection do
  describe "#.setup" do
    it "connects to a specific database" do
      expect(PG).to receive(:connect).with(dbname: 'shore_test')
      DatabaseConnection.setup('shore_test')
    end
  end
end

require 'database_connection'

describe DatabaseConnection do

  let(:database) { described_class }

  describe "setup" do
    it "creates a new conneection" do
      expect(PG).to receive(:connect).with(dbname: "chiiter_test")
      database.setup("chitter_test")
    end

  end

end

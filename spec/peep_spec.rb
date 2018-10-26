require 'peep'

describe Peep do
  describe '.all' do
    it "returns all the peeps" do
      connection = PG.connect(dbname: 'peep_manager_test')

      connection.exec("INSERT INTO peeps (message) VALUES ('message one');")
      connection.exec("INSERT INTO peeps (message) VALUES ('message two');")
      connection.exec("INSERT INTO peeps (message) VALUES ('message three');")

      peeps = Peep.all

      expect(peeps).to include("message one")
      expect(peeps).to include("message two")
      expect(peeps).to include("message three")
    end
  end
end

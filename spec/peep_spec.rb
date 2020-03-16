require 'peep'

describe Peep do
  describe '#posted_peeps' do
    it 'shows all peeps posted' do
      # peeps = Peep.posted_peeps.join(" ")
      # expect(peeps).to include("This is a peep")
      # expect(peeps).to include("Another peep")
      # expect(peeps).to include("Never gets old")
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (body) VALUES ('Test peep one');")
      connection.exec("INSERT INTO peeps (body) VALUES ('Test peep two');")
      connection.exec("INSERT INTO peeps (body) VALUES ('Test peep three');")

      peeps = Peep.posted_peeps
      expect(peeps).to include("Test peep one")
      expect(peeps).to include("Test peep two")
      expect(peeps).to include("Test peep three")
    end
  end
end

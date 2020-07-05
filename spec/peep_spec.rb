require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO chitter (peeps) VALUES('Hello this is a peep');")
      connection.exec("INSERT INTO chitter (peeps) VALUES('also a peep');")
      connection.exec("INSERT INTO chitter (peeps) VALUES('another peep');")

      peeps = Peep.all

      expect(peeps).to include("Hello this is a peep")
      expect(peeps).to include("also a peep")
      expect(peeps).to include("another peep")
    end
  end
end

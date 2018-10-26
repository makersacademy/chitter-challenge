require 'peep'

describe Peep do
  describe '.view_all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

    # Add the test data
      connection.exec("INSERT INTO peeps (message) VALUES ('This is a peep');")
      connection.exec("INSERT INTO peeps (message) VALUES('This is another peep');")
      connection.exec("INSERT INTO peeps (message) VALUES('This is a third peep');")

      peep = Peep.view_all

      expect(peep).to include("This is a peep")
      expect(peep).to include("This is another peep")
      expect(peep).to include("This is a third peep")
    end
  end
end

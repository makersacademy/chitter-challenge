require 'peeps'

describe Peep do
  describe '#view all peeps' do
    it 'shows all posted peeps on feed ' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (message) VALUES('First peep');")
      connection.exec("INSERT INTO peeps (message) VALUES('Second peep');")
      connection.exec("INSERT INTO peeps (message) VALUES('Third peep');")

      peeps = Peep.all
      
      expect(peeps).to include("First peep")
      expect(peeps).to include("Second peep")
      expect(peeps).to include("Third peep")
    end
  end

end
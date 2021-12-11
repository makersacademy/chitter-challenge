require 'peeps'

describe Peep do
  describe '#view all peeps' do
    it 'shows all posted peeps on feed ' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (name,message) VALUES('ruby123', 'First peep');")
      connection.exec("INSERT INTO peeps (name,message) VALUES('javascript123', 'Second peep');")
      connection.exec("INSERT INTO peeps (name,message) VALUES('sql123', 'Third peep');")

      peeps = Peep.all
      
      expect(peeps).to include("First peep")
      expect(peeps).to include("Second peep")
      expect(peeps).to include("Third peep")
    end
  end

end
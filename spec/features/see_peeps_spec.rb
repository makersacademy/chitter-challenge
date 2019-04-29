describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'peeps_test')

      connection.exec("INSERT INTO peeps (peep) VALUES ('My first peep');")
      connection.exec("INSERT INTO peeps (peep) VALUES('My second peep');")

      peeps = Peep.all
      expect(peeps).to include("My first peep")
      expect(peeps).to include("My second peep")
    end
  end
end

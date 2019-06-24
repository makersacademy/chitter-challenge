  describe '.all' do
    it 'returns all Peeps' do
      connection = PG.connect(dbname: 'Chitter_test')

      connection.exec("INSERT INTO peeps (peep) VALUES ('Dear diary');")
      connection.exec("INSERT INTO peeps (peep) VALUES('Feeling blue');")
      connection.exec("INSERT INTO peeps (peep) VALUES('Happy thoughts');")

      peeps = Peep.all

      expect(peeps).to include("Dear diary")
      expect(peeps).to include("Feeling blue")
      expect(peeps).to include("Happy thoughts")
    end
  end

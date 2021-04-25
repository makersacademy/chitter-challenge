require 'peeps'

describe Peeps do
  describe '.all' do
    it 'returns all the peeps' do
      con = PG.connect(dbname: 'chitter_test')

      con.exec("INSERT INTO peeps VALUES(1,'You');" )
      con.exec("INSERT INTO peeps VALUES(2,'Hello');" )
      con.exec("INSERT INTO peeps VALUES (3,'Peep');" )

      
      peeps = Peeps.all

      expect(peeps).to include 'Hello'
      expect(peeps).to include 'You'
      expect(peeps).to include 'Peep'
    end
  end
end
require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO my_peeps (peep) VALUES ('This is my first peep');")
      peeps = Peep.all
      expect(peeps).to include("This is my first peep")
   
    end
  end
end
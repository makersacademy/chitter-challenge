require 'peep'

describe Peep do

  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (content) VALUES ('900 People die from Coronavirus');")
      connection.exec("INSERT INTO peeps (content) VALUES ('Lockdown is lifted');")
      connection.exec("INSERT INTO peeps (content) VALUES ('Coronavirus is over!');")
      
      peeps = Peep.all
      
      expect(peeps).to include("900 People die from Coronavirus")
      expect(peeps).to include("Lockdown is lifted")
      expect(peeps).to include("Coronavirus is over!")
    end
  end
end
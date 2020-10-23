require_relative '../../lib/peep.rb'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (peep) VALUES ('Congratulations to the Astronauts that left Earth today. Good choice');")
      connection.exec("INSERT INTO peeps (peep) VALUES ('Me, in hell: I was told there would be a “special” place for me?');")  
      
      peeps = Peep.all

      expect(peeps).to include "Me, in hell: I was told there would be a “special” place for me?"
      expect(peeps).to include "Congratulations to the Astronauts that left Earth today. Good choice"
    end
  end
end

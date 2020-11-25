require_relative '../../lib/peep.rb'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (peep, date, time) VALUES ('Congratulations to the Astronauts that left Earth today. Good choice', '2020-01-13', '10:30:00');")
      connection.exec("INSERT INTO peeps (peep, date, time) VALUES ('Me, in hell: I was told there would be a “special” place for me?', '2020-01-13', '10:30:00');")  
      
      peeps = Peep.all
      

      expect(peeps[0]['peep']).to contain "Me, in hell: I was told there would be a “special” place for me?"
      espect(peeps.count).to eq 2

    end
  end

  describe '.create' do
    it 'creates a new peep from the user input' do
      Peep.create(peep: "Me, in hell: I was told there would be a “special” place for me?")

      expect(Peep.all.first[0]).to include "Me, in hell: I was told there would be a “special” place for me?"
    end
  end
end


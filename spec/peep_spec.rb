require 'peep'

describe Peep do

  describe '.all' do
    it 'returns all peeps' do
      
      DatabaseConnection.query("INSERT INTO peeps (content) VALUES ('900 People die from Coronavirus');")
      DatabaseConnection.query("INSERT INTO peeps (content) VALUES ('Lockdown is lifted');")
      DatabaseConnection.query("INSERT INTO peeps (content) VALUES ('Coronavirus is over!');")
      
      peeps = Peep.all
      
      expect(peeps).to include("900 People die from Coronavirus")
      expect(peeps).to include("Lockdown is lifted")
      expect(peeps).to include("Coronavirus is over!")
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peep.create(content: 'Today is going to be a great day')

      expect(Peep.all).to include 'Today is going to be a great day'
    end
  end
end

require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps in reverse chronological order' do
      
      Peep.create(peep: "Hello weekend!")
      Peep.create(peep: "I love Chitter!")
      Peep.create(peep: "Good Bye COVID-19!")

      peeps = Peep.all

      expect(peeps).to include("Hello weekend!")
      expect(peeps).to include("I love Chitter!")
      expect(peeps).to include("Good Bye COVID-19!")
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peep.create(peep: 'Hello')

      expect(Peep.all).to include 'Hello'
    end
  end  
end

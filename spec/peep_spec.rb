require './app/lib/peep'

describe Peep do
  describe '.all' do
    it 'returns all the peeps' do
      Peep.create(peep: "Hello World")
      Peep.create(peep: "Hey, what is happening people")
      
      expected_peeps = [
        "Hello World",
        "Hey, what is happening people"
      ]

      expect(Peep.all).to eq expected_peeps
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peep.create(peep: "I am going to the beach")

      expect(Peep.all).to include "I am going to the beach"
    end
  end
end

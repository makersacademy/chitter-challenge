require './app/lib/peep'

describe Peep do
  describe '.all' do
    it 'returns all the peeps' do
      peep1 = Peep.create(peep: "Hello World")
      peep2 = Peep.create(peep: "Hey, what is happening people")

      expected_peeps = [
        peep2, peep1
      ]

      expect(Peep.all).to eq expected_peeps
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(peep: "I am going to the beach")

      expect(Peep.all).to include peep
    end
  end

  describe '#==' do
    it 'two peeps are matching if their IDs match' do
      peep1 = Peep.new(1, "Testing", created: "16/12")
      peep2 = Peep.new(1, "Testing", created: "16/12")

      expect(peep1).to eq peep2
    end
  end
end

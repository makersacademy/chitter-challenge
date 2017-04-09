require './app/models/peep'

describe Peep do

  describe '.chronological' do
    it 'returns the peeps in chronological order' do
      old_peep = Peep.create(experience: "Coast to coast")
      new_peep = Peep.create(experience: "Surfing with a view")
      expect(Peep.chronological).to eq [new_peep, old_peep]
    end
  end
end

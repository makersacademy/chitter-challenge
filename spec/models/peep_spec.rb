require './app/models/peep'

describe Peep do

  describe '.chronological' do
    it 'returns the peeps in chronological order' do
      old_peep = Peep.create(text: "Coast to coast", created_at: Time.now)
      new_peep = Peep.create(text: "Surfing with a view", created_at: Time.now)
      expect(Peep.chronological).to eq [new_peep, old_peep]
    end
  end
end

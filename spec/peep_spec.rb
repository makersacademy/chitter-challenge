require 'peep'

describe Peep do
  let(:time_now) { Time.parse(Time.now.strftime("%Y-%m-%d %H:%M:%S :z")) }

  describe '#new' do
    it 'creates a peep with id, message and time' do
      peep = Peep.new(id: 1, message: "New peep", sent_time: time_now)

      expect(peep.id).to eq(1)
      expect(peep.message).to eq("New peep")
      expect(peep.sent_time).to eq(time_now)
    end
  end
end

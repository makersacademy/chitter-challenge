require './app/models/peep'

describe Peep do
  let(:time) { (DateTime.now).strftime("%I:%M%p,%e %b %Y") }

  describe '#time' do
    it 'Generates the current time' do
      expect(Peep.time).to eq time
    end
  end
end

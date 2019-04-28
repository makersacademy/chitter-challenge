require 'peeps'

describe Peep do
  describe '#create' do
    it 'creates a new peep' do
      peeps = Peep.create(peep: "my first peep", time: Time.now)

      expect(peeps.peep).to eq 'my first peep'
      expect(peeps.time).to eq Time.now.strftime("%I:%M on %d %B, %Y")
    end
  end
end

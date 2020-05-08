require 'peep'

describe Peep do
  describe '#all' do
    it 'shows the peep and time of peep' do
      peeps = Peep.all

      expect(peeps.length).to eq 2
      expect(peeps.first).to be_a Peep
      expect(peeps.first.time).to include '2020-05-08'
      expect(peeps.first.peep).to eq 'Good morning!'
    end
  end
end
